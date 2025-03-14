import 'package:flutter/material.dart';
import 'package:withu/core/utils/extensions/theme_ext.dart';
import 'package:withu/core/utils/resource/string_res.dart';
import 'package:withu/feature/account/presentation/bloc/profile_registration/profile_registration_bloc.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/widgets/base_input/bottom_border_input.dart';

class CareerFormWidget extends StatelessWidget {
  const CareerFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocBuilder(
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
              Text('경력 1', style: context.textTheme.bodyLarge?.setBlack),
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

class _NameInputState extends State<_NameInput> {
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
    return BottomBorderInput.basic(
      context: context,
      controller: _controller,
      focusNode: _focusNode,
      hintText: StringRes.inputCareerName.tr,
      textInputAction: TextInputAction.next,
      onChanged: (String text) {},
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
    return BottomBorderInput.basic(
      context: context,
      controller: _controller,
      focusNode: _focusNode,
      hintText: StringRes.inputMax20Chars.tr,
      textInputAction: TextInputAction.next,
      onChanged: (String text) {},
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
    return BottomBorderInput.basic(
      context: context,
      controller: _controller,
      focusNode: _focusNode,
      hintText: StringRes.inputCompanyName.tr,
      textInputAction: TextInputAction.next,
      onChanged: (String text) {},
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
    return Row(
      children: [
        Expanded(child: _CareerFormFieldName.startDate()),
        const SizedBox(width: 8),
        Flexible(flex: 5, child: _DatePicker()),
      ],
    );
  }
}

class _EndDateRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _CareerFormFieldName.endDate()),
        const SizedBox(width: 8),
        Flexible(flex: 5, child: _DatePicker()),
      ],
    );
  }
}

class _DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDatePicker(
          context: context,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          firstDate: DateTime(1960),
          lastDate: DateTime(20500),
          currentDate: DateTime.now(),
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
            Expanded(child: Text('12312321')),
            const SizedBox(width: 20),
            Assets.images.calendar.svg(),
          ],
        ),
      ),
    );
  }
}
