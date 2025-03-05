import 'package:withu/feature/job_posting/data/data.dart';
import 'package:withu/feature/user/domain/domain.dart';

class JobPostingWorkerEntity {

  JobPostingWorkerEntity({
    required this.id,
    required this.userInfo,
    required this.isOnsite,
    this.workStartTime,
    this.workEndTime,
  });
  final String id;

  /// 유저 정보
  final SimpleUserEntity userInfo;

  /// 출근 여부
  final bool isOnsite;

  /// 근무 시작 시간
  final DateTime? workStartTime;

  /// 근무 종료 시간
  final DateTime? workEndTime;
}

extension JobPostingWorkerEntityExt on JobPostingWorkerEntity {
  static JobPostingWorkerEntity fromDto(JobPostingWorkerDto dto) {
    return JobPostingWorkerEntity(
      id: dto.id,
      userInfo: SimpleUserEntityExt.fromDto(dto.userInfo),
      isOnsite: dto.workStatus,
      workStartTime: dto.workStartTime,
      workEndTime: dto.workEndTime,
    );
  }
}
