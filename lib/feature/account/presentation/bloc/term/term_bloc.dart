import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/presentation/bloc/term/term_page_step_type.dart';

part 'term_bloc.handler.dart';

part 'term_event.dart';

part 'term_state.dart';

part 'term_bloc.freezed.dart';

typedef TermBlocProvider = BlocProvider<TermBloc>;

typedef TermBlocBuilder = BlocBuilder<TermBloc, TermState>;

class TermBloc extends BaseBloc<TermEvent, TermState> {
  TermBloc() : super(TermState(status: BaseBlocStatus.initial())) {
    on<TermAccountTypeSelected>(_onTermAccountTypeSelected);
    on<TermFirstNextPressed>(_onTermFirstNextPressed);
    on<TermSecondNextPressed>(_onTermSecondNextPressed);
  }
}
