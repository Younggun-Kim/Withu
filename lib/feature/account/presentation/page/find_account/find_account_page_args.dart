import 'package:withu/feature/account/presentation/bloc/find_account/find_account_bloc.dart';

class FindAccountPageArgs {
  final FindAccountPageType pageType;

  const FindAccountPageArgs({required this.pageType});

  factory FindAccountPageArgs.id() =>
      FindAccountPageArgs(pageType: FindAccountPageType.id);

  factory FindAccountPageArgs.password() =>
      FindAccountPageArgs(pageType: FindAccountPageType.password);
}
