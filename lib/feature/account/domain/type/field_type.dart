import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/utils/resource/string_res.dart';
import 'package:withu/gen/assets.gen.dart';

/// 계정 타입
@JsonEnum(valueField: 'serverKey')
enum FieldType {
  none(serverKey: ''),
  foodStyling(serverKey: 'FOOD_STYLING'),
  florist(serverKey: 'FLORIST'),
  photography(serverKey: 'PHOTOGRAPHY');

  final String serverKey;

  const FieldType({required this.serverKey});

  static List<FieldType> get valuesWithoutNone =>
      values.where((type) => !type.isNone).toList();

  bool get isNone => this == none;

  @override
  String toString() {
    switch (this) {
      case FieldType.foodStyling:
        return StringRes.foodStyling.tr;
      case FieldType.florist:
        return StringRes.flower.tr;
      case FieldType.photography:
        return StringRes.photography.tr;
      default:
        return '';
    }
  }
}

extension FieldTypeEx on FieldType {
  SvgGenImage? toAsset() {
    switch (this) {
      case FieldType.foodStyling:
        return Assets.images.utensils;
      case FieldType.florist:
        return Assets.images.flower;
      case FieldType.photography:
        return Assets.images.clapperboard;
      default:
        return null;
    }
  }
}
