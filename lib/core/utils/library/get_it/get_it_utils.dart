import 'package:get_it/get_it.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/domain/entity/sign_up_args/sign_up_args_value.dart';

final getIt = GetIt.instance;

AppRouter get getItAppRouter => getIt<AppRouter>();

GlobalBloc get getItGlobalBloc => getIt<GlobalBloc>();

class GetItUtils {
  static void setSignUpArgs(SignUpArgsValue args) {
    getIt.registerFactory<SignUpArgsValue>(() => args);
  }
}
