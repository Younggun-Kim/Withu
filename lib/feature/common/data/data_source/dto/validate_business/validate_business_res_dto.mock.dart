part of 'validate_business_res_dto.dart';

extension ValidateBusinessResDtoMock on ValidateBusinessResDto {
  static ValidateBusinessResDto success() {
    return ValidateBusinessResDto(
      success: true,
      message: '',
      data: ValidateBusinessResData(
        businessNumber: "123-45-67890",
        representativeName: "홍길동",
        companyName: "홍길동 상사",
        startDate: "2021-01-01",
        valid: "YES",
        status: "영업 중",
        isRegistered: false,
      ),
      error: null,
    );
  }

  static ValidateBusinessResDto duplicate() {
    return ValidateBusinessResDto(
      success: false,
      message: '',
      data: null,
      error: FailResponse(
        timestamp: "2025-02-26T10:15:30",
        status: 409,
        error: "BUSINESS_NUMBER_ALREADY_REGISTERED",
        message: "이미 가입된 사업자번호입니다",
        engMessage: "Business number already registered",
        path: "/common/validate-business",
      ),
    );
  }
}
