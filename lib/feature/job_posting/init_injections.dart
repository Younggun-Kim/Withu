import 'package:withu_app/core/core.dart';
import 'package:withu_app/feature/job_posting/data/data.dart';
import 'package:withu_app/feature/job_posting/domain/domain.dart';
import 'package:withu_app/feature/job_posting/job_posting.dart';
import 'package:withu_app/feature/job_posting/presentation/blocs/workers/job_posting_workers_bloc.dart';

initJobPostingInjections() {
  getIt.registerSingleton<JobPostingApi>(
    Environment.isProd ? JobPostingApiImpl() : JobPostingMockApi(),
  );
  getIt.registerSingleton<JobPostingRepository>(
    JobPostingRepositoryImpl(api: getIt()),
  );
  getIt.registerSingleton<JobPostingUseCase>(
    JobPostingUseCaseImpl(repository: getIt()),
  );
  getIt.registerFactory<JobPostingsTemporaryBloc>(
    () => JobPostingsTemporaryBloc(useCase: getIt()),
  );
  getIt.registerFactory<JobPostingsInProgressBloc>(
    () => JobPostingsInProgressBloc(useCase: getIt()),
  );
  getIt.registerFactory<JobPostingsClosedBloc>(
    () => JobPostingsClosedBloc(useCase: getIt()),
  );
  getIt.registerFactory<JobPostingsTabBloc>(
    () => JobPostingsTabBloc(),
  );
  getIt.registerFactory<JobPostingFormBloc>(
        () => JobPostingFormBloc(useCase: getIt()),
  );
  getIt.registerFactory<JobPostingDetailBloc>(
        () => JobPostingDetailBloc(useCase: getIt()),
  );
  getIt.registerFactory<JobPostingWorkersBloc>(
        () => JobPostingWorkersBloc(useCase: getIt()),
  );
}
