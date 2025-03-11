import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/presentation/bloc/term/term_page_step_type.dart';
import 'package:withu/feature/account/presentation/page/sign_up/sign_up_page_args.dart';
import 'package:withu/feature/common/presentation/page/validate_business/validate_business_page_args.dart';

part 'term_bloc.handler.dart';

part 'term_event.dart';

part 'term_state.dart';

part 'term_bloc.freezed.dart';

typedef TermBlocProvider = BlocProvider<TermBloc>;

typedef TermBlocBuilder = BlocBuilder<TermBloc, TermState>;

class TermBloc extends BaseBloc<TermEvent, TermState> {
  final AccountRepository accountRepo;

  TermBloc({required this.accountRepo})
    : super(TermState(status: BaseBlocStatus.initial())) {
    on<TermAccountTypeSelected>(_onTermAccountTypeSelected);
    on<TermFirstNextPressed>(_onTermFirstNextPressed);
    on<TermSecondNextPressed>(_onTermSecondNextPressed);
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
