part of 'job_posting_form_bloc.dart';

sealed class JobPostingFormEvent extends Equatable {}

/// 공고 제목 입력 이벤트
class OnChangedTitle extends JobPostingFormEvent {

  OnChangedTitle({required this.title});
  final String title;

  @override
  List<Object?> get props => [title];
}

/// 근로 내용 입력
class OnChangedContent extends JobPostingFormEvent {

  OnChangedContent({required this.content});
  final String content;

  @override
  List<Object?> get props => [content];
}

/// 카테고리 선택 이벤트
class OnPressedJobCategory extends JobPostingFormEvent {

  OnPressedJobCategory({required this.category});
  final JobCategoryType category;

  @override
  List<Object?> get props => [category];
}

/// 기간형식 선택 이벤트
class OnPressedContractType extends JobPostingFormEvent {

  OnPressedContractType({required this.contractType});
  final ContractType contractType;

  @override
  List<Object?> get props => [contractType];
}

/// 계약 시작 날짜 변경 이벤트
class OnChangedContractStartDate extends JobPostingFormEvent {

  OnChangedContractStartDate({required this.contractStartDate});
  final DateTime contractStartDate;

  @override
  List<Object?> get props => [contractStartDate];
}

/// 계약 종료 날짜 변경 이벤트
class OnChangedContractEndDate extends JobPostingFormEvent {

  OnChangedContractEndDate({required this.contractEndDate});
  final DateTime contractEndDate;

  @override
  List<Object?> get props => [contractEndDate];
}

/// 계약 시작 날짜 노출 토글 이벤트
class OnToggleStartCalendarVisible extends JobPostingFormEvent {
  OnToggleStartCalendarVisible();

  @override
  List<Object?> get props => [];
}

/// 계약 종료 달력 노출 토글 이벤트
class OnToggleEndCalendarVisible extends JobPostingFormEvent {
  OnToggleEndCalendarVisible();

  @override
  List<Object?> get props => [];
}

/// 미정 스위치 토글 이벤트
class OnToggleTBC extends JobPostingFormEvent {
  OnToggleTBC();

  @override
  List<Object?> get props => [];
}

/// 근무 시작 날짜 변경 이벤트
class OnChangedWorkStartTime extends JobPostingFormEvent {

  OnChangedWorkStartTime({required this.time});
  final DateTime time;

  @override
  List<Object?> get props => [time];
}

/// 근무 종료 날짜  변경 이벤트
class OnChangedWorkEndTime extends JobPostingFormEvent {

  OnChangedWorkEndTime({required this.time});
  final DateTime time;

  @override
  List<Object?> get props => [time];
}

/// 모집인원 입력 이벤트
class OnChangedParticipants extends JobPostingFormEvent {

  OnChangedParticipants({required this.participants});
  final String participants;

  @override
  List<Object?> get props => [participants];
}

/// 급여 타입 선택 이벤트.
class OnSelectedPayType extends JobPostingFormEvent {

  OnSelectedPayType({required this.payType});
  final PayType payType;

  @override
  List<Object?> get props => [payType];
}

/// 급여 입력 이벤트
class OnChangedPay extends JobPostingFormEvent {

  OnChangedPay({required this.pay});
  final String pay;

  @override
  List<Object?> get props => [pay];
}

/// 주소 찾기 클릭 이벤트
class OnPressedFindAddress extends JobPostingFormEvent {
  OnPressedFindAddress();

  @override
  List<Object?> get props => [];
}

/// 주소 찾기 클릭 이벤트
class OnChangedPreferredQualifications extends JobPostingFormEvent {

  OnChangedPreferredQualifications({required this.text});
  final String text;

  @override
  List<Object?> get props => [text];
}

/// 이동시간 유무 토글 이벤트.
class OnToggleHasTravelTime extends JobPostingFormEvent {
  OnToggleHasTravelTime();

  @override
  List<Object?> get props => [];
}

/// 이동시간 급여/비급여 토글 이벤트.
class OnSelectTravelTimePaid extends JobPostingFormEvent {

  OnSelectTravelTimePaid({required this.isPaid});
  final bool isPaid;

  @override
  List<Object?> get props => [isPaid];
}

/// 휴게시 유무 토글 이벤트.
class OnToggleHasBreakTime extends JobPostingFormEvent {
  OnToggleHasBreakTime();

  @override
  List<Object?> get props => [];
}

/// 휴게시간 급여/비급여 토글 이벤트.
class OnSelectBreakTimePaid extends JobPostingFormEvent {

  OnSelectBreakTimePaid({required this.isPaid});
  final bool isPaid;

  @override
  List<Object?> get props => [isPaid];
}

/// 휴게시 유무 토글 이벤트.
class OnToggleHasMealPaid extends JobPostingFormEvent {
  OnToggleHasMealPaid();

  @override
  List<Object?> get props => [];
}

/// 등록하기 버튼 클릭
class JobPostingFormSubmitted extends JobPostingFormEvent {
  JobPostingFormSubmitted();

  @override
  List<Object?> get props => [];
}

/// 공고 Id 저장
class JobPostingFormIdSet extends JobPostingFormEvent {

  JobPostingFormIdSet({required this.id});
  final String? id;

  @override
  List<Object?> get props => [id];
}

/// 상세 조회 이벤트
class JobPostingFormDetailFetched extends JobPostingFormEvent {
  @override
  List<Object?> get props => [];
}
