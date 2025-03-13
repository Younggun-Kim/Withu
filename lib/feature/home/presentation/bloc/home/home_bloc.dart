import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/domain/usecase/get_user_profile/get_user_profile_use_case.dart';
import 'package:withu/feature/account/domain/usecase/login/login_usecase.dart';
import 'package:withu/feature/home/domain/domain.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

part 'home_bloc.handler.dart';

typedef HomeBlocProvider = BlocProvider<HomeBloc>;

typedef HomeBlocBuilder = BlocBuilder<HomeBloc, HomeState>;

typedef HomeBlocConsumer = BlocConsumer<HomeBloc, HomeState>;

typedef HomeBlocListener = BlocListener<HomeBloc, HomeState>;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoginUseCase loginUseCase;
  final GetUserProfileUseCase getUserProfileUseCase;

  HomeBloc({required this.loginUseCase, required this.getUserProfileUseCase})
    : super(HomeState(status: BaseBlocStatus.initial())) {
    on<HomeInitialized>(_onHomeInitialized);
    on<HomeLogoutPressed>(_onHomeLogoutPressed);
    on<HomeBottomNaviPressed>(_onHomeBottomNaviPressed);
  }
}
