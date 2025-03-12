import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/domain/entity/phone/phone_value.dart';

class ChangePwPageArgs {
  final NameValue name;

  final EmailValue email;

  final PhoneValue phone;

  const ChangePwPageArgs({
    required this.name,
    required this.email,
    required this.phone,
  });

  static const empty = ChangePwPageArgs(
    name: NameValue(),
    email: EmailValue(),
    phone: PhoneValue(),
  );
}
