import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/splash/type/type.dart';

part 'splash_event.dart';

part 'splash_state.dart';

part 'splash_bloc.freezed.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  final LoginUseCase loginUseCase;

  SplashBloc({required this.loginUseCase})
    : super(SplashState(status: BaseBlocStatus.initial())) {
    on<OnInitializeApp>(_onOnInitializeApp);
  }

  FutureOr<void> _onOnInitializeApp(
    OnInitializeApp event,
    Emitter<SplashState> emit,
  ) async {
    // 1초 대기 후 홈 화면으로 이동.
    await Future.delayed(const Duration(seconds: 1));

    // final instance = await SharedPreferences.getInstance();
    // instance.clear();

    final isRefresh = await loginUseCase.refresh();

    emit(
      state.copyWith(
        status: BaseBlocStatus.success(),
        nextPage: SplashNextPageTypeExt.getNextPage(isRefresh),
      ),
    );
  }
}
