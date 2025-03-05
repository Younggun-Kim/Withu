part of 'validate_business_bloc.dart';

@freezed
class ValidateBusinessState extends BaseBlocState with _$ValidateBusinessState {
  factory ValidateBusinessState({
    /// 상태.
    required BaseBlocStatus status,

    /// 다이얼로그 메시지
    @Default('') String message,
  }) = _ValidateBusinessState;
}
