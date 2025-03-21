import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/presentation/bloc/career_form/career_form_bloc.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/bottom_sheet/select_date_calendar/select_date_calendar_bottom_sheet.dart';
import 'package:withu/shared/widgets/base_button/base_button.dart';
import 'package:withu/shared/widgets/base_button/enabled_fit_btn.dart';
import 'package:withu/shared/widgets/base_input/bottom_border_input.dart';

class CareerFormBottomSheet extends StatelessWidget {
  final Function(CareerEntity) onUpdate;

  final VoidCallback onDeleted;

  const CareerFormBottomSheet({
    super.key,
    required this.onUpdate,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return CareerFormBlocConsumer(
      listener: (context, state) {},
      builder: (context, state) {
        return KeyboardDismissOnTap(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 35),
            margin: EdgeInsets.only(bottom: bottomInset),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '경력 추가',
                    style: context.textTheme.bodyLargeBold?.setBlack,
                  ),
                  const SizedBox(height: 15),
                  _NameRow(),
                  const SizedBox(height: 5),
                  _ContentRow(),
                  const SizedBox(height: 5),
                  _CompanyNameRow(),
                  const SizedBox(height: 5),
                  _StartDateRow(),
                  const SizedBox(height: 5),
                  _EndDateRow(),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseButton.fit(
                        context: context,
                        text: StringRes.doDelete.tr,
                        onTap: () {
                          onDeleted();
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      EnabledFitBtn(
                        text: StringRes.doSave.tr,
                        isEnabled: state.isValid(),
                        onTap: () {
                          context.keyboardUnfocus();
                          onUpdate(state.getCareerEntity());
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// 바텀 시트 보기.
  static Future show({
    required BuildContext context,
    required CareerEntity career,
    required Function(CareerEntity) onUpdate,
    required VoidCallback onDeleted,
  }) async {
    final careerFormBloc = context.read<CareerFormBloc>();

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (modalContext) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: careerFormBloc..add(CareerFormInitialized(entity: career)),
            ),
          ],
          child: CareerFormBottomSheet(
            onUpdate: onUpdate,
            onDeleted: onDeleted,
          ),
        );
      },
    );
  }
}

class _CareerFormFieldName extends StatelessWidget {
  final String text;

  const _CareerFormFieldName({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.textTheme.bodySmall?.setSecondary,
    );
  }

  factory _CareerFormFieldName.name() =>
      _CareerFormFieldName(text: StringRes.name.tr);

  factory _CareerFormFieldName.content() =>
      _CareerFormFieldName(text: StringRes.content.tr);

  factory _CareerFormFieldName.companyName() =>
      _CareerFormFieldName(text: StringRes.companyName.tr);

  factory _CareerFormFieldName.startDate() =>
      _CareerFormFieldName(text: StringRes.startDate.tr);

  factory _CareerFormFieldName.endDate() =>
      _CareerFormFieldName(text: StringRes.endDate.tr);
}

class _NameInput extends StatefulWidget {
  const _NameInput();

  @override
  State<StatefulWidget> createState() => _NameInputState();
}

class _NameInputState extends State<_NameInput>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<CareerFormBloc>().state.name.value;
  }

  @override
  void dispose() {
    _controller;
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CareerFormBlocListener(
      listener: (context, state) {
        if (state.name.value != _controller.text) {
          _controller.text = state.name.value;
        }
      },
      child: BottomBorderInput.basic(
        context: context,
        controller: _controller,
        focusNode: _focusNode,
        hintText: StringRes.inputCareerName.tr,
        textInputAction: TextInputAction.next,
        onChanged: (String text) {
          context.read<CareerFormBloc>().add(
            CareerFormNameInputted(value: text),
          );
        },
      ),
    );
  }
}

class _NameRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _CareerFormFieldName.name()),
        const SizedBox(width: 8),
        Flexible(flex: 5, child: _NameInput()),
      ],
    );
  }
}

class _ContentInput extends StatefulWidget {
  const _ContentInput();

  @override
  State<StatefulWidget> createState() => _ContentInputState();
}

class _ContentInputState extends State<_ContentInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<CareerFormBloc>().state.content.value;
  }

  @override
  void dispose() {
    _controller;
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CareerFormBlocListener(
      listener: (context, state) {
        if (state.content.value != _controller.text) {
          _controller.text = state.content.value;
        }
      },
      child: BottomBorderInput.basic(
        context: context,
        controller: _controller,
        focusNode: _focusNode,
        hintText: StringRes.inputMax20Chars.tr,
        textInputAction: TextInputAction.next,
        onChanged: (String text) {
          context.read<CareerFormBloc>().add(
            CareerFormContentInputted(value: text),
          );
        },
      ),
    );
  }
}

class _ContentRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _CareerFormFieldName.content()),
        const SizedBox(width: 8),
        Flexible(flex: 5, child: _ContentInput()),
      ],
    );
  }
}

class _CompanyNameInput extends StatefulWidget {
  const _CompanyNameInput();

  @override
  State<StatefulWidget> createState() => _CompanyNameInputState();
}

class _CompanyNameInputState extends State<_CompanyNameInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<CareerFormBloc>().state.company.value;
  }

  @override
  void dispose() {
    _controller;
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CareerFormBlocListener(
      listener: (context, state) {
        if (state.company.value != _controller.text) {
          _controller.text = state.company.value;
        }
      },
      child: BottomBorderInput.basic(
        context: context,
        controller: _controller,
        focusNode: _focusNode,
        hintText: StringRes.inputCompanyName.tr,
        textInputAction: TextInputAction.next,
        onChanged: (String text) {
          context.read<CareerFormBloc>().add(
            CareerFormCompanyInputted(value: text),
          );
        },
      ),
    );
  }
}

class _CompanyNameRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _CareerFormFieldName.companyName()),
        const SizedBox(width: 8),
        Flexible(flex: 5, child: _CompanyNameInput()),
      ],
    );
  }
}

class _StartDateRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CareerFormBlocBuilder(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(child: _CareerFormFieldName.startDate()),
            const SizedBox(width: 8),
            Flexible(
              flex: 5,
              child: _DatePicker(
                date: state.startDate.value,
                onChanged: (DateTime newDate) {
                  context.read<CareerFormBloc>().add(
                    CareerFormStartDateChanged(value: newDate),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _EndDateRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CareerFormBlocBuilder(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(child: _CareerFormFieldName.endDate()),
            const SizedBox(width: 8),
            Flexible(
              flex: 5,
              child: _DatePicker(
                date: state.endDate.value,
                onChanged: (DateTime newDate) {
                  context.read<CareerFormBloc>().add(
                    CareerFormEndDateChanged(value: newDate),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DatePicker extends StatelessWidget {
  final String date;

  final Function(DateTime) onChanged;

  const _DatePicker({required this.date, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final bool dateIsEmpty = date.isEmpty;
    final text = dateIsEmpty ? 'YYYY/MM/DD' : date;
    final textColor = dateIsEmpty ? ColorName.secondary : ColorName.text;
    return InkWell(
      onTap: () async {
        await SelectDateCalendarBottomSheet.show(
          context: context,
          initFocusDate:
              DateFormat('yyyy-MM-dd').tryParse(date) ?? DateTime.now(),
          onChanged: onChanged,
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: ColorName.tertiary)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                text,
                style: context.textTheme.bodySmall?.copyWith(color: textColor),
              ),
            ),
            const SizedBox(width: 20),
            Assets.images.calendar.svg(),
          ],
        ),
      ),
    );
  }
}
