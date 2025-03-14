import 'area_entity.dart';

typedef AreaEntities = List<AreaEntity>;

extension AreaEntitiesEx on AreaEntities {
  /// 선택된 것만 가져오기
  AreaEntities getSelected() {
    return where((entity) => entity.isSelected).toList();
  }
}
