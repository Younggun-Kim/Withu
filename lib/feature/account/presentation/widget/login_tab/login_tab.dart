import 'package:flutter/cupertino.dart';
import 'package:withu/core/core.dart';
import 'package:withu/shared/shared.dart';

import 'login_tab_data.dart';

/// 로그인 탭
class LoginTab extends StatelessWidget {

  const LoginTab({super.key, required this.selectedType, required this.onTap});
  final AccountType selectedType;

  final void Function(LoginTabData tab) onTap;

  @override
  Widget build(BuildContext context) {
    return BaseTabs(
      tabs: LoginTabData.values,
      selectedTab: LoginTabData.getSelected(selectedType),
      onTap: (BaseTabData tab) {
        onTap(tab as LoginTabData);
      },
    );
  }
}
