import 'package:withu/feature/account/account.dart';

class FindIdResultPageArgs {
  final bool isFound;
  final String name;
  final String email;
  final SignUpMethodType signUpMethod;

  FindIdResultPageArgs({
    required this.isFound,
    required this.name,
    required this.email,
    required this.signUpMethod,
  });
}
