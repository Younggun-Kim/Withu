import 'package:withu/feature/account/domain/type/account_type.dart';
import 'package:withu/core/utils/resource/string_res.dart';
import 'package:withu/shared/shared.dart';

class LoginTabData extends BaseTabData<AccountType> {
  const LoginTabData({required super.text, required super.value});

  static List<LoginTabData> get values => [
    LoginTabData(
      text: StringRes.findingGeekWorker.tr,
      value: AccountType.company,
    ),
    LoginTabData(text: StringRes.findingNewJob.tr, value: AccountType.user),
  ];

  /// 선택된 탭 데이터 얻기
  static LoginTabData getSelected(AccountType type) {
    return values.firstWhere((data) => type == data.value);
  }
}
