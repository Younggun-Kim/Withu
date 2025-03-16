import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/common/presentation/bloc/phone_auth/phone_auth_bloc.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

import 'phone_auth_widget_key.dart';

/// 휴대폰 번호 인증 UI
class PhoneAuthWidget extends StatelessWidget {
  const PhoneAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [PhoneInput(), AuthCodeInput(), _VerifyResultWrapper()],
    );
  }
}

/// 휴대폰번호 입력
class PhoneInput extends StatelessWidget {
  const PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
      builder: (context, state) {
        return BaseInput(
          key: PhoneAuthWidgetKey.phoneInput.toKey(),
          hintText: StringRes.enterOnlyNumber.tr,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          suffix: const SendAuthBtn(),
          onChanged: (String text) {
            context.read<PhoneAuthBloc>().add(
              PhoneAuthPhoneInputted(value: text),
            );
          },
        );
      },
    );
  }
}

/// 인증 전송 버튼
class SendAuthBtn extends StatelessWidget {
  const SendAuthBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneAuthBlocBuilder(
      builder: (context, state) {
        return InkWell(
          key: PhoneAuthWidgetKey.sendAuthBtn.toKey(),
          splashColor: Colors.transparent,
          onTap: () {
            context.read<PhoneAuthBloc>().add(PhoneAuthAuthCodeSent());
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 13),
            decoration: BoxDecoration(
              color: ColorName.secondary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              StringRes.verification.tr,
              style: context.textTheme.bodySmallBold?.setWhite,
            ),
          ),
        );
      },
    );
  }
}

/// 인증번호 입력
class AuthCodeInput extends StatelessWidget {
  const AuthCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
      builder: (context, state) {
        if (!state.isSuccessSend) {
          return const SizedBox();
        }
        return Container(
          margin: const EdgeInsets.only(top: 11),
          child: BaseInput(
            key: PhoneAuthWidgetKey.authCodeInput.toKey(),
            hintText: StringRes.enterVerificationCode.tr,
            maxLength: 6,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            suffix: VerifyBtn(),
            onChanged: (String text) {
              context.read<PhoneAuthBloc>().add(
                PhoneAuthAuthCodeInputted(value: text),
              );
            },
          ),
        );
      },
    );
  }
}

/// 인증 확인 버튼
class VerifyBtn extends StatelessWidget {
  const VerifyBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneAuthBlocBuilder(
      builder: (context, state) {
        return InkWell(
          key: PhoneAuthWidgetKey.verifyBtn.toKey(),
          splashColor: Colors.transparent,
          onTap: () {
            context.read<PhoneAuthBloc>().add(PhoneAuthVerifyRequested());
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 13),
            decoration: BoxDecoration(
              color: ColorName.secondary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              StringRes.confirm.tr,
              style: context.textTheme.bodySmallBold?.setWhite,
            ),
          ),
        );
      },
    );
  }
}

/// 인증 요청 문구
class _VerifyResultText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PhoneAuthBlocBuilder(
      builder: (context, state) {
        if (state.verifyState.isSentFailure) {
          return Text(
            '인증번호 전송에 실패하였습니다.',
            style: context.textTheme.bodySmall?.setPoint,
          );
        }
        if (state.verifyState.isBeforeVerify) {
          return Text(
            '3분이내에 입력해주세요.',
            style: context.textTheme.bodySmall?.setPoint,
          );
        }
        if (state.verifyState.isSuccess) {
          return Text(
            '인증번호가 일치합니다.',
            style: context.textTheme.bodySmall?.setBlack,
          );
        }
        if (state.verifyState.isFailure) {
          return Text(
            '인증번호가 일치하지 않습니다.',
            style: context.textTheme.bodySmall?.setPoint,
          );
        }

        return const SizedBox();
      },
    );
  }
}

/// 인증 요청 문구 Wrapper
class _VerifyResultWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 7),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: _VerifyResultText(),
    );
  }
}
