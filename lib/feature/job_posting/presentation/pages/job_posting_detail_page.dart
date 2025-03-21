import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/feature.dart';
import 'package:withu/feature/job_posting/domain/domain.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

/// 공고 상세 화면
@RoutePage()
class JobPostingDetailPage extends StatelessWidget {
  const JobPostingDetailPage({super.key, required this.jobPostingId});
  final String jobPostingId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JobPostingDetailBloc>(
          create:
              (context) => getIt()..add(OnGettingDetailData(id: jobPostingId)),
        ),
      ],
      child: _JobPostingDetailPage(),
    );
  }
}

class _JobPostingDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobPostingDetailBloc, JobPostingDetailState>(
      listener: (context, state) async {
        if (state.message.isNotEmpty) {
          CustomAlertDialog.showContentAlert(
            context: context,
            content: state.message,
            closeCallback: () {
              context.read<JobPostingDetailBloc>().add(ClearMessage());
            },
          );
        }

        if (state.status.isClosed || state.status.isDeleted) {
          context.router.maybePop(true);
        }

        if (state.status.isPushUpdate) {
          final bloc = context.read<JobPostingDetailBloc>();
          final bool? isUpdated = await context.router.push(
            JobPostingFormRoute(jobPostingId: state.entity?.id),
          );

          bloc.add(OnPopForm());

          if (isUpdated == true) {
            bloc.add(JobPostingDetailRefreshed());
          }
        }
      },
      builder: (context, state) {
        return PageRoot(
          isLoading: state.status.isLoading,
          safeAreaTop: false,
          child: CustomScrollView(
            slivers: [
              _AppBar(),
              _Header(
                companyThumbnail: state.entity?.companyThumbnail ?? '',
                companyName: state.entity?.companyName ?? '',
                views: state.entity?.views ?? 0,
              ),
              SliverFillRemaining(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _ContractPeriod(
                        period: state.entity?.contractPeriod ?? '',
                      ),
                      const SizedBox(height: 30),
                      _WorkHours(time: state.entity?.workHours ?? ''),
                      const SizedBox(height: 30),
                      _Participants(number: state.entity?.participants ?? ''),
                      const SizedBox(height: 30),
                      _PayAmount(
                        payType: state.entity?.payType.tr ?? '',
                        amount: state.entity?.payAmount ?? '',
                      ),
                      const SizedBox(height: 30),
                      _Address(address: state.entity?.workAddress ?? ''),
                      const SizedBox(height: 10),
                      _Map(),
                      const SizedBox(height: 30),
                      _FieldName(text: StringRes.preferences.tr),
                      const SizedBox(height: 10),
                      _PreferredQualifications(
                        text: state.entity?.preferredQualifications ?? '',
                      ),
                      const SizedBox(height: 30),
                      _FieldAndSwitch(
                        fieldName: StringRes.travelTimeOrNot.tr,
                        isOn: state.entity?.hasTravelTime ?? false,
                        onPressedGuide: () {
                          GuideDialog.showTravelTime(context);
                        },
                      ),
                      _PayInfo(
                        visible: state.entity?.hasTravelTime == true,
                        isPaid: state.entity?.isTravelTimePaid,
                      ),
                      const SizedBox(height: 30),
                      _FieldAndSwitch(
                        fieldName: StringRes.breakTimeOrNot.tr,
                        isOn: state.entity?.hasBreakTime ?? false,
                        onPressedGuide: () {
                          GuideDialog.showBreakTime(context);
                        },
                      ),
                      _PayInfo(
                        visible: state.entity?.hasBreakTime == true,
                        isPaid: state.entity?.isBreakTimePaid,
                      ),
                      const SizedBox(height: 30),
                      _FieldAndSwitch(
                        fieldName: StringRes.mealPaidOrNot.tr,
                        isOn: state.entity?.isMealProvided ?? false,
                        onPressedGuide: () {
                          GuideDialog.showMeal(context);
                        },
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// AppBar 영역
class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobPostingDetailBloc, JobPostingDetailState>(
      builder: (context, state) {
        return SliverAppBar(
          scrolledUnderElevation: 0,
          backgroundColor: ColorName.tertiary,
          pinned: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.router.maybePop();
            },
          ),
          actions: [_MoreOptionButton()],
        );
      },
    );
  }
}

/// 더보기 버튼
class _MoreOptionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MoreOptions<DetailBottomSheetType>(
      items: DetailBottomSheetType.values,
      onSelected: (DetailBottomSheetType item) {
        final option = DetailBottomSheetFactory.getOption(item);

        if (option == null) {
          return;
        }

        DescriptionBottomSheet.show(
          context: context,
          option: option,
          bloc: context.read<JobPostingDetailBloc>(),
        );
      },
    );
  }
}

/// Header 영역
class _Header extends StatelessWidget {
  const _Header({
    required this.companyThumbnail,
    required this.companyName,
    required this.views,
  });
  final String companyThumbnail;

  final String companyName;

  final int views;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobPostingDetailBloc, JobPostingDetailState>(
      builder: (context, state) {
        return PinnedHeaderSliver(
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 28.5),
            decoration: BoxDecoration(
              color: ColorName.tertiary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: state.entity?.categoryType != null,
                      child: BaseBadge(
                        text: state.entity?.categoryType.tr ?? '',
                        backgroundColor: ColorName.primary,
                        margin: const EdgeInsets.only(right: 8),
                        textStyle: context.textTheme.bodySmall?.copyWith(
                          color: ColorName.background,
                        ),
                      ),
                    ),
                    Text(
                      state.entity?.title ?? '',
                      style: context.textTheme.headlineLarge,
                    ),
                  ],
                ),
                Text(
                  state.entity?.content ?? '',
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.network(
                        companyThumbnail,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (
                              BuildContext context,
                              Object error,
                              StackTrace? stackTrace,
                            ) => const SizedBox(),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(companyName, style: context.textTheme.bodySmall),
                    const SizedBox(width: 17),
                    Text('|', style: context.textTheme.bodySmall),
                    const SizedBox(width: 17),
                    Text('조회수 $views', style: context.textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// 필드명
class _FieldName extends StatelessWidget {
  const _FieldName({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: context.textTheme.bodyMediumBold);
  }
}

/// 근로계약기간
class _ContractPeriod extends StatelessWidget {
  const _ContractPeriod({required this.period});
  final String period;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FieldName(text: StringRes.workContractPeriod.tr),
        const Spacer(),
        Text(period, style: context.textTheme.bodyLarge),
      ],
    );
  }
}

/// 근무시간
class _WorkHours extends StatelessWidget {
  const _WorkHours({required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FieldName(text: StringRes.workHours.tr),
        const Spacer(),
        Text(time, style: context.textTheme.bodyLarge),
      ],
    );
  }
}

/// 모집인원
class _Participants extends StatelessWidget {
  const _Participants({required this.number});
  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FieldName(text: StringRes.workHours.tr),
        const Spacer(),
        Text(
          '$number${StringRes.numberOfPeopleUnit.tr}',
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}

/// 급여
class _PayAmount extends StatelessWidget {
  const _PayAmount({required this.payType, required this.amount});
  final String payType;

  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FieldName(text: StringRes.wage.tr),
        const Spacer(),
        Visibility(
          visible: payType.isNotEmpty,
          child: BaseBadge(text: payType, backgroundColor: ColorName.tertiary),
        ),
        const SizedBox(width: 9),
        Text(
          '${amount.moneyFormat()}${StringRes.wonUnit.tr}',
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}

/// 주소
class _Address extends StatelessWidget {
  const _Address({required this.address});
  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldName(text: StringRes.address.tr),
        const SizedBox(width: 50),
        Expanded(
          child: Text(
            address,
            textAlign: TextAlign.end,
            maxLines: 2,
            style: context.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

/// 지도
// TODO: 추후 지도 추가 예정.
class _Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      decoration: BoxDecoration(
        color: ColorName.tertiary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: AspectRatio(
        aspectRatio: 288 / 188,
        child: Center(child: Text('지도 영역', style: context.textTheme.bodyLarge)),
      ),
    );
  }
}

/// 우대사항
class _PreferredQualifications extends StatelessWidget {
  const _PreferredQualifications({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return LinedTextFormField(
      controller: TextEditingController(text: text),
      readOnly: true,
    );
  }
}

/// 필드, 스위치
class _FieldAndSwitch extends StatelessWidget {
  const _FieldAndSwitch({
    required this.fieldName,
    required this.isOn,
    required this.onPressedGuide,
  });
  final String fieldName;

  final bool isOn;

  final VoidCallback onPressedGuide;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FieldName(text: fieldName),
        const SizedBox(width: 12),
        InkWell(
          onTap: onPressedGuide,
          child: const Icon(Icons.help, color: ColorName.primary),
        ),
        const Spacer(),
        BaseSwitch(
          isOn: isOn,
          onTap: () {
            // TODO: Guide 추가 예정.
          },
        ),
      ],
    );
  }
}

/// 급여/비급여 정보
class _PayInfo extends StatelessWidget {
  const _PayInfo({required this.visible, this.isPaid});
  final bool visible;

  final bool? isPaid;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: const EdgeInsets.only(top: 6),
        child: Row(
          children: [
            RadioChip(
              text: StringRes.wage.tr,
              isSelected: isPaid == true,
              enabled: false,
            ),
            const SizedBox(width: 13),
            RadioChip(
              text: StringRes.nonWage.tr,
              isSelected: isPaid == false,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
