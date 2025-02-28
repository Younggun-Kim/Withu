part of 'login_bloc.dart';

extension LoginBlocConverter on LoginBloc {
  LoginRequestEntity toEntity() {
    return LoginRequestEntity(
      loginType: LoginType.email,
      loginId: state.loginId.value,
      password: state.password.value,
    );
  }
}
