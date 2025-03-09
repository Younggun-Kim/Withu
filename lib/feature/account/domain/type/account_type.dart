import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/utils/resource/string_res.dart';
import 'package:withu/gen/assets.gen.dart';

/// 계정 타입
@JsonEnum(valueField: 'serverKey')
enum AccountType {
  none(serverKey: ''),

  /// 고용주
  company(serverKey: 'COMPANY'),

  /// 근로자
  user(serverKey: 'STAFF');

  final String serverKey;

  const AccountType({required this.serverKey});

  static List<AccountType> get valuesWithoutNone =>
      values.where((type) => !type.isNone).toList();

  bool get isNone => this == none;

  bool get iSCompany => this == company;

  bool get isUser => this == user;
}

extension AccountTypeEx on AccountType {
  SvgGenImage? get toIcon {
    switch (this) {
      case AccountType.none:
        return null;
      case AccountType.company:
        return Assets.images.building2;
      case AccountType.user:
        return Assets.images.usersRound;
    }
  }

  String get toStartMsg {
    switch (this) {
      case AccountType.none:
        return "";
      case AccountType.company:
        return StringRes.employerSignup.tr;
      case AccountType.user:
        return StringRes.workerSignup.tr;
    }
  }
}
