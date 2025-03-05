part of 'job_posting_workers_bloc.dart';

sealed class JobPostingWorkersEvent {}

/// 공고 Id 저장
class JobPostingWorkersIdStored extends JobPostingWorkersEvent {

  JobPostingWorkersIdStored({required this.id});
  /// 공고 Id
  final String id;
}

/// 화면 초기화
class JobPostingWorkersSearched extends JobPostingWorkersEvent {

  JobPostingWorkersSearched({required this.page});
  final int page;
}

/// 메시지 초기화
class JobPostingWorkersMessageCleared extends JobPostingWorkersEvent {}
