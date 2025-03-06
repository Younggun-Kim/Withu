part of 'validate_business_res_dto.dart';

extension ValidateBusinessResDtoMock on ValidateBusinessResDto {
  static ValidateBusinessResDto success() {
    return ValidateBusinessResDto(
      businessNumber: "123-45-67890",
      representativeName: "홍길동",
      companyName: "홍길동 상사",
      startDate: "2021-01-01",
      valid: "YES",
      status: "영업 중",
      isRegistered: true,
    );
  }
}
