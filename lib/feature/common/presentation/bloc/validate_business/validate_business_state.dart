part of 'validate_business_bloc.dart';

@freezed
class ValidateBusinessState extends BaseBlocState with _$ValidateBusinessState {
  factory ValidateBusinessState({
    /// 상태.
    required BaseBlocStatus status,

    /// 다이얼로그 메시지
    @Default('') String message,

    /// 사업자등록번호
    @Default(BusinessNumValue()) BusinessNumValue businessNum,

    /// 대표자명
    @Default(CeoNameValue()) CeoNameValue ceoName,

    /// 회사명
    @Default(CompanyNameValue()) CompanyNameValue companyName,

    /// 개업일자
    @Default(OpenDateValue()) OpenDateValue openDate,
  }) = _ValidateBusinessState;
}

extension ValidateBusinessStateEx on ValidateBusinessState {
  bool get isEnabledBtn {
    return businessNum.isValid() &&
        ceoName.isValid() &&
        companyName.isValid() &&
        openDate.isValid();
  }
}
