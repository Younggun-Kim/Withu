import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/shared/shared.dart';
import 'package:withu/shared/widgets/base_input/slash_date_input.dart';

@RoutePage()
class ValidateBusinessPage extends StatelessWidget {
  final ValidateBusinessPageArgs args;

  const ValidateBusinessPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return ValidateBusinessBlocProvider(
      create:
          (context) => getIt()..add(ValidateBusinessArgsStored(value: args)),
      child: _ValidateBusinessPageContent(),
    );
  }
}

class _ValidateBusinessPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValidateBusinessBlocConsumer(
      listener: (context, state) {},
      builder: (context, state) {
        return PageRoot(
          isLoading: state.status.isLoading,
          appBar: CustomAppBar.back(context: context),
          padding: CustomEdgeInsets.horizontalPadding(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Assets.images.logoPuzzle2.svg(),
                const SizedBox(height: 10),
                _Title(),
                const SizedBox(height: 14),
                _Description(),
                const SizedBox(height: 35),
                _FieldName(text: '사업자등록증 번호'),
                const SizedBox(height: 11),
                BusinessNumberInput(),
                const SizedBox(height: 7),
                Visibility(
                  visible: state.iSDuplicated.isVisible,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '올바른 사업자등록 번호가 아닙니다.',
                      style: context.textTheme.bodySmall?.setPoint,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _FieldName(text: '대표자 이름'),
                const SizedBox(height: 11),
                CeoNameInput(),
                const SizedBox(height: 20),
                _FieldName(text: '회사 이름'),
                const SizedBox(height: 11),
                CompanyNameInput(),
                const SizedBox(height: 20),
                _FieldName(text: '개업일자'),
                const SizedBox(height: 11),
                OpenDateInput(),
                const SizedBox(height: 25),
                _CheckDuplicateBtn(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '안전한 연결과 더 큰 기회를 위해!',
      style: context.textTheme.headlineMedium?.setBlack,
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '책임감 있는 채용을 위해, 사업자등록번호를 확인하고 있어요',
      style: context.textTheme.bodyMedium?.setBlack,
    );
  }
}

class _CheckDuplicateBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValidateBusinessBlocBuilder(
      builder: (context, state) {
        return EnabledBtn(
          text: '중복확인',
          isEnabled: state.isEnabledBtn,
          onTap: () {
            context.read<ValidateBusinessBloc>().add(
              ValidateBusinessCheckDuplicationPressed(),
            );
          },
        );
      },
    );
  }
}

class _FieldName extends StatelessWidget {
  final String text;

  const _FieldName({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: context.textTheme.bodyMediumBold);
  }
}

class BusinessNumberInput extends StatefulWidget {
  const BusinessNumberInput({super.key});

  @override
  BusinessNumberInputState createState() => BusinessNumberInputState();
}

class BusinessNumberInputState extends State<BusinessNumberInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_formatBusinessNumber);
  }

  @override
  void dispose() {
    _controller.removeListener(_formatBusinessNumber);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _formatBusinessNumber() {
    String text = _controller.text.replaceAll(RegExp(r'\D'), ''); // 숫자만 남김
    String formattedText = _applyFormat(text);

    if (_controller.text != formattedText) {
      _controller.value = TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }

  /// 숫자 문자열을 사업자등록번호 형식으로 변환
  String _applyFormat(String digits) {
    if (digits.isEmpty) return '';

    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i == 3 || i == 5) buffer.write('-'); // 3번째, 5번째 자리에서 '-' 추가
      buffer.write(digits[i]);
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      controller: _controller,
      focusNode: _focusNode,
      hintText: '000-00-00000',
      keyboardType: TextInputType.number,
      maxLength: 10,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (String text) {
        context.read<ValidateBusinessBloc>().add(
          ValidateBusinessNumInputted(value: BusinessNumValue(text.onlyNum)),
        );
      },
    );
  }
}

class CeoNameInput extends StatefulWidget {
  const CeoNameInput({super.key});

  @override
  State<StatefulWidget> createState() => CeoNameInputState();
}

class CeoNameInputState extends State<CeoNameInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      hintText: '이름을 입력해주세요.',
      controller: _controller,
      focusNode: _focusNode,
      onChanged: (String text) {
        context.read<ValidateBusinessBloc>().add(
          ValidateBusinessCeoNameInputted(value: CeoNameValue(text)),
        );
      },
    );
  }
}

class CompanyNameInput extends StatefulWidget {
  const CompanyNameInput({super.key});

  @override
  State<StatefulWidget> createState() => CompanyNameInputState();
}

class CompanyNameInputState extends State<CompanyNameInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      hintText: '회사 이름을 입력해주세요.',
      onChanged: (String text) {
        context.read<ValidateBusinessBloc>().add(
          ValidateBusinessCompanyNameInputted(value: CompanyNameValue(text)),
        );
      },
    );
  }
}

class OpenDateInput extends StatefulWidget {
  const OpenDateInput({super.key});

  @override
  State<StatefulWidget> createState() => OpenDateInputState();
}

class OpenDateInputState extends State<OpenDateInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlashDateInput(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: (String text) {
        context.read<ValidateBusinessBloc>().add(
          ValidateBusinessOpenDateNameInputted(value: OpenDateValue(text)),
        );
      },
    );
  }
}
