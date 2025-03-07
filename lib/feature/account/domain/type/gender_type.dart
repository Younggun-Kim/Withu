import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/gen/assets.gen.dart';

/// 성별 타입
@JsonEnum(valueField: 'serverKey')
enum GenderType {
  none(serverKey: ''),

  /// 남성
  male(serverKey: 'MALE'),

  /// 여성
  female(serverKey: 'FEMALE');

  final String serverKey;

  const GenderType({required this.serverKey});

  static List<GenderType> get valuesWithoutNone =>
      values.where((type) => !type.isNone).toList();

  bool get isNone => this == none;

  bool get isMale => this == male;

  bool get isFemale => this == female;

  @override
  String toString() {
    switch (this) {
      case none:
        return '';
      case male:
        return '남자';
      case female:
        return '여자';
    }
  }

  SvgGenImage? toSvg() {
    switch (this) {
      case none:
        return null;
      case male:
        return Assets.images.mars;
      case female:
        return Assets.images.venus;
    }
  }
}
