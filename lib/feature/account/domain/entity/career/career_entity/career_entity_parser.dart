part of 'career_entity.dart';

extension CareerEntityParser on CareerEntity {
  String getId() {
    return isTemp ? '' : id;
  }

  CareerDto toDto(int orderIndex) {
    return CareerDto(
      id: getId(),
      title: name.value,
      description: content.value,
      companyName: companyName.value,
      startDate: startDate.getDashed(),
      endDate: endDate.getDashed(),
      orderIndex: orderIndex,
    );
  }

  static CareerEntity fromDto(CareerDto dto) {
    return CareerEntity(
      id: dto.id,
      name: NameValue(dto.title),
      content: CareerContentValue(dto.description),
      companyName: CompanyNameValue(dto.companyName),
      startDate: CareerDateValue(dto.startDate),
      endDate: CareerDateValue(dto.endDate),
      isTemp: false,
    );
  }
}

extension CareerEntitiesParser on CareerEntities {
  CareerListDto toDto() {
    return mapIndexed<CareerDto>(
      (index, CareerEntity career) => career.toDto(index),
    ).toList();
  }

  static CareerEntities fromDto(CareerListDto dtos) {
    return dtos.map((dto) => CareerEntityParser.fromDto(dto)).toList();
  }
}
