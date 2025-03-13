part of 'login_request_entity.dart';

extension LoginRequestEntityConverter on LoginRequestEntity {
  /// entity -> dto
  LoginRequestDto toDto() {
    return LoginRequestDto(
      email: loginId,
      password: password,
      accountType: UserType.company.serverKey,
    );
  }
}
