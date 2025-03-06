import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/utils/bloc/base_bloc.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/feature/common/domain/usecase/validate_business_usecase.dart';

part 'validate_business_bloc.handler.dart';

part 'validate_business_event.dart';

part 'validate_business_state.dart';

part 'validate_business_bloc.freezed.dart';

typedef ValidateBusinessBlocProvider = BlocProvider<ValidateBusinessBloc>;

typedef ValidateBusinessBlocBuilder =
    BlocBuilder<ValidateBusinessBloc, ValidateBusinessState>;

class ValidateBusinessBloc
    extends BaseBloc<ValidateBusinessEvent, ValidateBusinessState> {
  final ValidateBusinessUseCase useCase;

  ValidateBusinessBloc({required this.useCase})
    : super(ValidateBusinessState(status: BaseBlocStatus.initial())) {
    on<ValidateBusinessNumInputted>(_onValidateBusinessNumInputted);
    on<ValidateCeoNameInputted>(_onValidateCeoNameInputted);
    on<ValidateCompanyNameInputted>(_onValidateCompanyNameInputted);
    on<ValidateOpenDateNameInputted>(_onValidateOpenDateNameInputted);
  }
}
