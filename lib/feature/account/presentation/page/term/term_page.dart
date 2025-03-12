import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/domain/type/term_type.dart';
import 'package:withu/feature/account/presentation/bloc/term/term_bloc.dart';
import 'package:withu/feature/account/presentation/bloc/term/term_page_step_type.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

@RoutePage()
class TermPage extends StatelessWidget {
  const TermPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TermBlocProvider(
      create: (context) => getIt(),
      child: _TermPageContent(),
    );
  }
}

class _TermPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TermBlocBuilder(
      builder: (context, state) {
        return PageRoot(
          isLoading: state.status.isLoading,
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 36),
          appBar: CustomAppBar.back(context: context),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.step.toAsset().svg(),
                const SizedBox(height: 10),
                _Title(step: state.step),
                const SizedBox(height: 14),
                _Description(step: state.step),
                const SizedBox(height: 106),
                _FirstStepContents(),
                _SecondStepContents(),
                const SizedBox(height: 20),
                _NextBtn(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  final TermPageStepType step;

  const _Title({required this.step});

  @override
  Widget build(BuildContext context) {
    return Text(
      step.toTitle(),
      style: context.textTheme.headlineMedium?.copyWith(color: ColorName.text),
    );
  }
}

class _Description extends StatelessWidget {
  final TermPageStepType step;

  const _Description({required this.step});

  @override
  Widget build(BuildContext context) {
    return Text(
      step.toDescription(),
      style: context.textTheme.bodyMedium?.copyWith(color: ColorName.text),
    );
  }
}

class _NextBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TermBlocBuilder(
      builder: (context, state) {
        return state.step.isFirst ? _FirstStepNextBtn() : _SecondStepNextBtn();
      },
    );
  }
}

class _FirstStepNextBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TermBlocBuilder(
      builder: (context, state) {
        return EnabledBtn(
          text: StringRes.next.tr,
          isEnabled: state.isEnabledFirstStep,
          onTap: () {
            context.read<TermBloc>().add(TermFirstNextPressed());
          },
        );
      },
    );
  }
}

class _SecondStepNextBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TermBlocBuilder(
      builder: (context, state) {
        return EnabledBtn(
          text: StringRes.next.tr,
          isEnabled: state.isEnabledSecondStep,
          onTap: () {
            context.read<TermBloc>().add(TermSecondNextPressed());
          },
        );
      },
    );
  }
}

class _FirstStepContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TermBlocBuilder(
      builder: (context, state) {
        if (!state.step.isFirst) {
          return const SizedBox();
        }
        return Column(
          children: [
            SelectableIconBtn(
              text: AccountType.company.toStartMsg,
              isSelected: state.accountType.iSCompany,
              icon:
                  AccountType.company.toIcon?.svg(
                    colorFilter: ColorFilter.mode(
                      state.accountType.iSCompany ? Colors.white : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ) ??
                  const SizedBox(),
              onTap: () {
                context.read<TermBloc>().add(
                  TermAccountTypeSelected(value: AccountType.company),
                );
              },
            ),
            const SizedBox(height: 25),
            SelectableIconBtn(
              text: AccountType.user.toStartMsg,
              isSelected: state.accountType.isUser,
              icon:
                  AccountType.user.toIcon?.svg(
                    colorFilter: ColorFilter.mode(
                      state.accountType.isUser ? Colors.white : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ) ??
                  const SizedBox(),
              onTap: () {
                context.read<TermBloc>().add(
                  TermAccountTypeSelected(value: AccountType.user),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _SecondStepContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TermBlocBuilder(
      builder: (context, state) {
        if (state.step.isFirst) {
          return const SizedBox();
        }

        return Column(
          children: [
            _TermCheckItem(
              isChecked: state.isAllChecked,
              isRequired: true,
              text: '전체 동의',
              url: '',
              onTap: () {
                context.read<TermBloc>().add(
                  TermAllAgreementTapped(isChecked: !state.isAllChecked),
                );
              },
            ),
            const SizedBox(height: 16),
            _TermCheckItem(
              isChecked: state.isRequiredChecked,
              isRequired: true,
              text: '필수 약관 동의',
              url: '',
              onTap: () {
                context.read<TermBloc>().add(
                  TermRequiredAgreementTapped(
                    isChecked: !state.isRequiredChecked,
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            Divider(),
            const SizedBox(height: 25),
            _TermCheckItem(
              isChecked: state.serviceTerm,
              isRequired: TermType.service.isRequired,
              text: TermType.service.toString(),
              url: TermType.service.url,
              onTap: () {
                context.read<TermBloc>().add(TermServiceAgreementTapped());
              },
            ),
            const SizedBox(height: 18),
            _TermCheckItem(
              isChecked: state.privacyTerm,
              isRequired: TermType.privacy.isRequired,
              text: TermType.privacy.toString(),
              url: TermType.privacy.url,
              onTap: () {
                context.read<TermBloc>().add(TermPrivacyAgreementTapped());
              },
            ),
            const SizedBox(height: 18),
            _TermCheckItem(
              isChecked: state.financeTerm,
              isRequired: TermType.finance.isRequired,
              text: TermType.finance.toString(),
              url: TermType.finance.url,
              onTap: () {
                context.read<TermBloc>().add(TermFinanceAgreementTapped());
              },
            ),
            const SizedBox(height: 18),
            _TermCheckItem(
              isChecked: state.locationTerm,
              isRequired: TermType.location.isRequired,
              text: TermType.location.toString(),
              url: TermType.location.url,
              onTap: () {
                context.read<TermBloc>().add(TermLocationAgreementTapped());
              },
            ),
            const SizedBox(height: 18),
            _TermCheckItem(
              isChecked: state.marketingTerm,
              isRequired: TermType.marketing.isRequired,
              text: TermType.marketing.toString(),
              url: TermType.marketing.url,
              onTap: () {
                context.read<TermBloc>().add(TermMarketingAgreementTapped());
              },
            ),
            const SizedBox(height: 18),
          ],
        );
      },
    );
  }
}

class _TermCheckItem extends StatelessWidget {
  final bool isChecked;

  final bool isRequired;

  final String text;

  final String url;

  final VoidCallback onTap;

  const _TermCheckItem({
    required this.isChecked,
    required this.isRequired,
    required this.text,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? boldStyle = context.textTheme.bodyLargeBold?.setBlack;

    final TextStyle? defaultStyle = context.textTheme.bodyLarge?.setBlack;

    final TextStyle? style = isRequired ? boldStyle : defaultStyle;

    final SvgGenImage checkbox =
        isChecked ? Assets.images.checkBoxOn : Assets.images.checkBoxOff;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          checkbox.svg(),
          const SizedBox(width: 10),
          Text(text, style: style),
          const Spacer(),
          _LinkBtn(url: url),
        ],
      ),
    );
  }
}

class _LinkBtn extends StatelessWidget {
  final String url;

  const _LinkBtn({required this.url});
  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return const SizedBox();
    }
    return InkWell(
      onTap: () {
        OutLink.openUrl(context, url);
      },
      child: Text('보기', style: context.textTheme.bodySmall?.setSecondary),
    );
  }
}
