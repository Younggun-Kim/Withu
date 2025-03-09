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
      errorCode: '',
    );
  }

  static ValidateBusinessResDto duplicate() {
    return ValidateBusinessResDto(
      success: false,
      message: '중복된 사업자입니다.',
      data: null,
      errorCode: 'SERVER_ERROR',
    );
  }
}
