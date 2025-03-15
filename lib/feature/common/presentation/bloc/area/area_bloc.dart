import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/common/domain/entity/area/area_entity.dart';
import 'package:withu/feature/common/domain/usecase/area/area_use_case.dart';

part 'area_bloc_handler.dart';

part 'area_event.dart';

part 'area_state.dart';

part 'area_bloc.freezed.dart';

typedef AreaBlocProvider = BlocProvider<AreaBloc>;

typedef AreaBlocBuilder = BlocBuilder<AreaBloc, AreaState>;

typedef AreaBlocConsumer = BlocConsumer<AreaBloc, AreaState>;

typedef AreaBlocListener = BlocListener<AreaBloc, AreaState>;

class AreaBloc extends BaseBloc<AreaEvent, AreaState> {
  final AreaUseCase areaUseCase;

  AreaBloc({required this.areaUseCase})
    : super(AreaState(status: BaseBlocStatus.initial())) {
    on<AreaInitialized>(_onAreaInitialized);
    on<AreaReset>(_onAreaReset);
    on<AreaSidoSelected>(_onAreaSidoSelected);
    on<AreaSggSelected>(_onAreaSggSelected);
    on<AreaEmdSelected>(_onAreaEmdSelected);
    on<AreaSubmitted>(_onAreaSubmitted);
  }
}
