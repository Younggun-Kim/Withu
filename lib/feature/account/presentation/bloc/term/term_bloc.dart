import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/presentation/bloc/term/term_page_step_type.dart';
import 'package:withu/feature/account/presentation/page/term/term_page_args.dart';

part 'term_bloc.handler.dart';

part 'term_event.dart';

part 'term_state.dart';

part 'term_bloc.freezed.dart';

typedef TermBlocProvider = BlocProvider<TermBloc>;

typedef TermBlocBuilder = BlocBuilder<TermBloc, TermState>;

class TermBloc extends BaseBloc<TermEvent, TermState> {
  TermBloc() : super(TermState(status: BaseBlocStatus.initial())) {
    on<TermAccountTypeSelected>(_onTermAccountTypeSelected);
    on<TermArgsStored>(_onTermArgsStored);
    on<TermFirstNextPressed>(_onTermFirstNextPressed);
    on<TermAllAgreementTapped>(_onTermAllAgreementTapped);
    on<TermRequiredAgreementTapped>(_onTermRequiredAgreementTapped);
    on<TermServiceAgreementTapped>(_onTermServiceAgreementTapped);
    on<TermShowServiceTermTapped>(_onTermShowServiceTermTapped);
    on<TermPrivacyAgreementTapped>(_onTermPrivacyAgreementTapped);
    on<TermShowPrivacyTermTapped>(_onTermShowPrivacyTermTapped);
    on<TermFinanceAgreementTapped>(_onTermFinanceAgreementTapped);
    on<TermShowFinanceTermTapped>(_onTermShowFinanceTermTapped);
    on<TermLocationAgreementTapped>(_onTermLocationAgreementTapped);
    on<TermShowLocationTermTapped>(_onTermShowLocationTermTapped);
    on<TermMarketingAgreementTapped>(_onTermMarketingAgreementTapped);
    on<TermShowMarketingTermTapped>(_onTermShowMarketingTermTapped);
  }
}
