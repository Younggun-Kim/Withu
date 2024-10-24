import 'package:withu_app/feature/job_posting/data/data.dart';

import 'job_posting_worker_entity.dart';

class JobPostingWorkersEntity {
  /// 공고명
  final String title;

  /// 인원 수
  final int participants;

  /// 근무 시작 일
  final DateTime workStartDate;

  /// 근무 종료일
  final DateTime workEndDate;

  /// 지원자 목록
  final List<JobPostingWorkerEntity> workers;

  JobPostingWorkersEntity({
    required this.title,
    required this.participants,
    required this.workStartDate,
    required this.workEndDate,
    required this.workers,
  });
}

extension JobPostingWorkersEntityExt on JobPostingWorkersEntity {
  JobPostingWorkersEntity fromDto(JobPostingWorkersDto dto) {
    return JobPostingWorkersEntity(
      title: dto.title,
      participants: dto.participants,
      workStartDate: dto.workStartDate,
      workEndDate: dto.workEndDate,
      workers: dto.content
          .map((JobPostingWorkerDto workerDto) =>
              JobPostingWorkerEntityExt.fromDto(workerDto))
          .toList(),
    );
  }
}
