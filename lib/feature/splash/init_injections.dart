import 'package:withu/core/utils/library/get_it/get_it_utils.dart';
import 'package:withu/feature/splash/presentation/bloc/splash_bloc.dart';

initSplashInjections() {
  getIt.registerFactory<SplashBloc>(() => SplashBloc(loginUseCase: getIt()));
}
