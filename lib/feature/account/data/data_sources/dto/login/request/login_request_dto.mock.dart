part of 'login_request_dto.dart';

extension LoginRequestDtoMock on LoginRequestDto {
  static LoginRequestDto mock() {
    return LoginRequestDto(
      accountType: AccountType.company.serverKey,
      email: 'test@test.com',
      password: '123qwe!@',
    );
  }
}
