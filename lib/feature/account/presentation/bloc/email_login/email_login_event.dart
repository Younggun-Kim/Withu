part of 'email_login_bloc.dart';

abstract class EmailLoginEvent extends BaseBlocEvent {}

class EmailLoginEmailInputted extends EmailLoginEvent {
  final String value;

  EmailLoginEmailInputted({required this.value});

  EmailValue get email => EmailValue(value);
}

class EmailLoginPasswordInputted extends EmailLoginEvent {
  final String value;

  EmailLoginPasswordInputted({required this.value});

  PasswordValue get password => PasswordValue(value);
}

class EmailLoginSubmitted extends EmailLoginEvent {}
