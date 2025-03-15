import 'package:withu/core/utils/resource/string_res.dart';
import 'package:withu/gen/assets.gen.dart';

/// 계정 타입
enum UserType {
  none(serverKey: 'AUTO'),

  /// 고용주
  company(serverKey: 'COMPANY'),

  /// 근로자
  staff(serverKey: 'STAFF');

  final String serverKey;

  const UserType({required this.serverKey});

  static List<UserType> get valuesWithoutNone =>
      values.where((type) => !type.isNone).toList();

  bool get isNone => this == none;

  bool get iSCompany => this == company;

  bool get isStaff => this == staff;
}

extension UserTypeEx on UserType {
  SvgGenImage? get toIcon {
    switch (this) {
      case UserType.none:
        return null;
      case UserType.company:
        return Assets.images.building2;
      case UserType.staff:
        return Assets.images.usersRound;
    }
  }

  String get toStartMsg {
    switch (this) {
      case UserType.none:
        return "";
      case UserType.company:
        return StringRes.employerSignup.tr;
      case UserType.staff:
        return StringRes.workerSignup.tr;
    }
  }
}
