import 'package:withu/core/utils/injections.dart';
import 'package:withu/feature/splash/presentation/bloc/splash_bloc.dart';

initSplashInjections() {
  getIt.registerFactory<SplashBloc>(() => SplashBloc(loginUseCase: getIt()));
}
