import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:withu/core/utils/extensions/theme_ext.dart';
import 'package:withu/core/utils/resource/string_res.dart';
import 'package:withu/feature/account/presentation/bloc/profile_add/profile_add_bloc.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

class CareerFormWidget extends StatelessWidget {
  const CareerFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.fromLTRB(15, 13, 19, 19),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: context.boxShadowTheme.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('경력 추가', style: context.textTheme.bodyLargeBold?.setBlack),
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
              Center(
                child: IntrinsicWidth(
                  child: EnabledFitBtn(
                    text: StringRes.doRegistration.tr,
                    isEnabled: state.isValidCareerForm,
                    onTap: () {
                      context.read<ProfileAddBloc>().add(
                        ProfileAddFormRegistered(),
                      );
                    },
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
    _controller;
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
    return ProfileAddBlocListener(
      listener: (context, state) {
        if (state.careerFormName.value != _controller.text) {
          _controller.text = state.careerFormName.value;
        }
      },
      child: BottomBorderInput.basic(
        context: context,
        controller: _controller,
        focusNode: _focusNode,
        hintText: StringRes.inputCareerName.tr,
        textInputAction: TextInputAction.next,
        onChanged: (String text) {
          context.read<ProfileAddBloc>().add(
            ProfileAddFormNameInputted(value: text),
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
    _controller;
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
    return ProfileAddBlocListener(
      listener: (context, state) {
        if (state.careerFormContent.value != _controller.text) {
          _controller.text = state.careerFormContent.value;
        }
      },
      child: BottomBorderInput.basic(
        context: context,
        controller: _controller,
        focusNode: _focusNode,
        hintText: StringRes.inputMax20Chars.tr,
        textInputAction: TextInputAction.next,
        onChanged: (String text) {
          context.read<ProfileAddBloc>().add(
            ProfileAddFormContentInputted(value: text),
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
    _controller;
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
    return ProfileAddBlocListener(
      listener: (context, state) {
        if (state.careerFormCompany.value != _controller.text) {
          _controller.text = state.careerFormCompany.value;
        }
      },
      child: BottomBorderInput.basic(
        context: context,
        controller: _controller,
        focusNode: _focusNode,
        hintText: StringRes.inputCompanyName.tr,
        textInputAction: TextInputAction.next,
        onChanged: (String text) {
          context.read<ProfileAddBloc>().add(
            ProfileAddFormCompanyInputted(value: text),
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
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(child: _CareerFormFieldName.startDate()),
            const SizedBox(width: 8),
            Flexible(
              flex: 5,
              child: _DatePicker(
                date: state.careerFormStartDate.value,
                onChanged: (DateTime newDate) {
                  context.read<ProfileAddBloc>().add(
                    ProfileAddFormStartDateChanged(value: newDate),
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
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(child: _CareerFormFieldName.endDate()),
            const SizedBox(width: 8),
            Flexible(
              flex: 5,
              child: _DatePicker(
                date: state.careerFormEndDate.value,
                onChanged: (DateTime newDate) {
                  context.read<ProfileAddBloc>().add(
                    ProfileAddFormEndDateChanged(value: newDate),
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
