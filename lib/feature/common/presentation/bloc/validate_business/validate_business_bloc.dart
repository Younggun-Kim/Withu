import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/presentation/page/sign_up/sign_up_page_args.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/feature/common/domain/usecase/validate_business_usecase.dart';

part 'validate_business_bloc.handler.dart';

part 'validate_business_event.dart';

part 'validate_business_state.dart';

part 'validate_business_bloc.freezed.dart';

typedef ValidateBusinessBlocProvider = BlocProvider<ValidateBusinessBloc>;

typedef ValidateBusinessBlocBuilder =
    BlocBuilder<ValidateBusinessBloc, ValidateBusinessState>;

typedef ValidateBusinessBlocConsumer =
    BlocConsumer<ValidateBusinessBloc, ValidateBusinessState>;

class ValidateBusinessBloc
    extends BaseBloc<ValidateBusinessEvent, ValidateBusinessState> {
  final ValidateBusinessUseCase useCase;

  ValidateBusinessBloc({required this.useCase})
    : super(ValidateBusinessState(status: BaseBlocStatus.initial())) {
    on<ValidateBusinessArgsStored>(_onValidateBusinessArgsStored);
    on<ValidateBusinessNumInputted>(_onValidateBusinessNumInputted);
    on<ValidateBusinessCeoNameInputted>(_onValidateBusinessCeoNameInputted);
    on<ValidateBusinessCompanyNameInputted>(
      _onValidateBusinessCompanyNameInputted,
    );
    on<ValidateBusinessOpenDateNameInputted>(
      _onValidateBusinessOpenDateNameInputted,
    );
    on<ValidateBusinessCheckDuplicationPressed>(
      _onValidateBusinessCheckDuplicationPressed,
    );
  }
}
