import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

part 'home_bloc.handler.dart';

typedef HomeBlocProvider = BlocProvider<HomeBloc>;

typedef HomeBlocBuilder = BlocBuilder<HomeBloc, HomeState>;

typedef HomeBlocConsumer = BlocConsumer<HomeBloc, HomeState>;

typedef HomeBlocListener = BlocListener<HomeBloc, HomeState>;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(status: BaseBlocStatus.initial()));
}
