import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/presentation/bloc/term/term_bloc.dart';
import 'package:withu/feature/account/presentation/bloc/term/term_page_step_type.dart';
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
              SelectableIconBtn(
                text: AccountType.company.toStartMsg,
                isSelected: state.accountType.iSCompany,
                icon:
                    AccountType.company.toIcon?.svg(
                      colorFilter: ColorFilter.mode(
                        state.accountType.iSCompany
                            ? Colors.white
                            : Colors.black,
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
              Spacer(),
              _NextBtn(),
              const SizedBox(height: 30),
            ],
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

class _AccountBtnList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          AccountType.valuesWithoutNone
              .map(
                (type) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorName.tertiary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(type.toStartMsg),
                ),
              )
              .toList(),
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
          isEnabled: !state.step.isFirst,
          onTap: () {
            context.read<TermBloc>().add(TermFirstNextPressed());
          },
        );
      },
    );
  }
}
