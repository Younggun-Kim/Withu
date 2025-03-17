part of 'career_form_bloc.dart';

@freezed
class CareerFormState extends BaseBlocState with _$CareerFormState {
  factory CareerFormState({
    required BaseBlocStatus status,

    /// 경력 Id
    @Default('') String careerId,

    /// 경력 폼 이름
    @Default(NameValue()) NameValue name,

    /// 경력 폼 내용
    @Default(CareerContentValue()) CareerContentValue content,

    /// 경력 폼 회사 이름
    @Default(CompanyNameValue()) CompanyNameValue company,

    /// 경력 폼 시작 날짜
    @Default(CareerDateValue()) CareerDateValue startDate,

    /// 경력 폼 종료 날짜
    @Default(CareerDateValue()) CareerDateValue endDate,
  }) = _CareerFormState;
}

extension CareerFormStateEx on CareerFormState {
  CareerEntity getCareerEntity() {
    final temp = CareerEntity.temp();
    return temp.copyWith(
      id: careerId,
      name: name,
      content: content,
      companyName: company,
      startDate: startDate,
      endDate: endDate,
    );
  }

  bool isValid() => getCareerEntity().isValid();
}
