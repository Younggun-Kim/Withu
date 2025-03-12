import 'package:freezed_annotation/freezed_annotation.dart';

/// 계정 타입
@JsonEnum(valueField: 'serverKey')
enum FieldType {
  none(serverKey: ''),
  foodStyling(serverKey: 'FOOD_STYLING'),
  flower(serverKey: 'FLOWER'),
  camera(serverKey: 'CAMERA');

  final String serverKey;

  const FieldType({required this.serverKey});

  static List<FieldType> get valuesWithoutNone =>
      values.where((type) => !type.isNone).toList();

  bool get isNone => this == none;
}
