import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/common/common.dart';

class MockAccountUseCase extends Mock implements PhoneAuthUseCase {}

void main() {
  late MockAccountUseCase mockUseCase;
  late PhoneAuthBloc phoneAuthBloc;
  const validPhone = '01012345678';
  const invalidPhone = '0101238';
  const validAuthCode = '123456';
  const invalidAuthCode = '098765';
  const validSessionId = 'test-session-id';

  setUp(() {
    mockUseCase = MockAccountUseCase();
    phoneAuthBloc = PhoneAuthBloc(phoneAuthUseCase: mockUseCase);
  });

  test('초기화 상태', () {
    expect(phoneAuthBloc.state.status, isA<BaseBlocStatusInitial>());
    expect(phoneAuthBloc.state.phone, equals(PhoneValue()));
    expect(phoneAuthBloc.state.authCode, equals(AuthCodeValue()));
    expect(phoneAuthBloc.state.verifyState, equals(VerifyStateType.beforeSend));
  });

  blocTest(
    '휴대폰 번호 입력',
    build: () => phoneAuthBloc,
    act: (bloc) => bloc.add(PhoneAuthPhoneInputted(value: validPhone)),
    expect:
        () => [
          isA<PhoneAuthState>()
              .having(
                (state) => state.phone,
                'input phone number',
                const PhoneValue(validPhone),
              )
              .having((state) => state.phone.isValid(), 'phoneValid', isTrue),
        ],
  );

  blocTest(
    '유효하지 않은 휴대폰 번호 입력',
    build: () => phoneAuthBloc,
    act: (bloc) => bloc.add(PhoneAuthPhoneInputted(value: invalidPhone)),
    expect:
        () => [
          isA<PhoneAuthState>()
              .having(
                (state) => state.phone,
                'phone_auth.dart',
                const PhoneValue(invalidPhone),
              )
              .having((state) => state.phone.isValid(), 'phoneValid', isFalse),
        ],
  );

  blocTest(
    '인증번호 전송',
    build:
        () =>
            phoneAuthBloc..emit(
              PhoneAuthState(
                status: BaseBlocStatus.initial(),
                phone: const PhoneValue(validPhone),
              ),
            ),
    setUp: () {
      when(
        () => mockUseCase.sendAuthCode(phone: any(named: 'phone')),
      ).thenAnswer((_) async => SendAuthCodeResValueMock.success());
    },
    act: (bloc) => bloc.add(PhoneAuthAuthCodeSent()),
    verify: (_) {
      verify(
        () => mockUseCase.sendAuthCode(phone: any(named: 'phone')),
      ).called(1);
    },
    expect:
        () => [
          isA<PhoneAuthState>()
              .having(
                (state) => state.status,
                'loading status',
                isA<BaseBlocStatusLoading>(),
              )
              .having(
                (state) => state.verifyState,
                'check verifyState',
                VerifyStateType.beforeSend,
              )
              .having(
                (state) => state.isSuccessSend,
                'check isSuccessSend',
                isFalse,
              ),
          isA<PhoneAuthState>()
              .having(
                (state) => state.status,
                'success status',
                isA<BaseBlocStatusSuccess>(),
              )
              .having(
                (state) => state.isSuccessSend,
                'check isSuccessSend',
                isTrue,
              )
              .having(
                (state) => state.sessionId,
                'valid session id',
                validSessionId,
              )
              .having(
                (state) => state.verifyState,
                'verifyState',
                VerifyStateType.beforeVerify,
              ),
        ],
  );

  blocTest(
    '유효한 인증번호 입력',
    build: () {
      return phoneAuthBloc..emit(
        PhoneAuthState(
          status: BaseBlocStatus.initial(),
          phone: const PhoneValue(validPhone),
        ),
      );
    },

    act: (bloc) => bloc.add(PhoneAuthAuthCodeInputted(value: validAuthCode)),
    expect:
        () => [
          isA<PhoneAuthState>()
              .having(
                (state) => state.authCode,
                'authCode',
                const AuthCodeValue(validAuthCode),
              )
              .having(
                (state) => state.authCode.isValid(),
                'authCodeValid',
                isTrue,
              ),
        ],
  );

  blocTest(
    '유효하지 않은 인증번호 입력 ',
    build:
        () =>
            phoneAuthBloc..emit(
              PhoneAuthState(
                status: BaseBlocStatus.initial(),
                phone: const PhoneValue(validPhone),
              ),
            ),
    act: (bloc) => bloc.add(PhoneAuthAuthCodeInputted(value: invalidAuthCode)),
    expect:
        () => [
          isA<PhoneAuthState>()
              .having(
                (state) => state.authCode,
                'authCode',
                const AuthCodeValue(invalidAuthCode),
              )
              .having(
                (state) => state.authCode.isValid(),
                'authCodeValid',
                isTrue,
              ),
        ],
  );

  blocTest(
    '인증번호 검증 성공 테스트',
    build: () {
      return phoneAuthBloc..emit(
        PhoneAuthState(
          status: BaseBlocStatus.initial(),
          phone: PhoneValue(validPhone),
          sessionId: validSessionId,
          authCode: AuthCodeValue(validAuthCode),
        ),
      );
    },
    setUp: () {
      when(
        () => mockUseCase.verifyAuthCode(
          sessionId: validSessionId,
          authCode: AuthCodeValue(validAuthCode),
        ),
      ).thenAnswer((_) async => true);
    },
    act: (bloc) => bloc.add(PhoneAuthVerifyRequested()),
    expect:
        () => [
          isA<PhoneAuthState>().having(
            (state) => state.status,
            'loading status',
            isA<BaseBlocStatusLoading>(),
          ),
          isA<PhoneAuthState>()
              .having(
                (state) => state.status,
                'success status',
                isA<BaseBlocStatusSuccess>(),
              )
              .having(
                (state) => state.verifyState.isSuccess,
                'success verify state',
                isTrue,
              ),
        ],
    verify: (_) {
      verify(
        () => mockUseCase.verifyAuthCode(
          sessionId: validSessionId,
          authCode: AuthCodeValue(validAuthCode),
        ),
      ).called(1);
    },
  );

  blocTest(
    '인증번호 검증 실패 테스트',
    build: () {
      return phoneAuthBloc..emit(
        PhoneAuthState(
          status: BaseBlocStatus.initial(),
          phone: PhoneValue(validPhone),
          sessionId: validSessionId,
          authCode: AuthCodeValue(validAuthCode),
        ),
      );
    },
    setUp: () {
      when(
        () => mockUseCase.verifyAuthCode(
          sessionId: validSessionId,
          authCode: AuthCodeValue(validAuthCode),
        ),
      ).thenAnswer((_) async => false);
    },
    act: (bloc) => bloc.add(PhoneAuthVerifyRequested()),
    expect:
        () => [
          isA<PhoneAuthState>().having(
            (state) => state.status,
            'loading status',
            isA<BaseBlocStatusLoading>(),
          ),
          isA<PhoneAuthState>()
              .having(
                (state) => state.status,
                'success status',
                isA<BaseBlocStatusFailure>(),
              )
              .having(
                (state) => state.verifyState.isFailure,
                'failure verify state',
                isTrue,
              ),
        ],
    verify: (_) {
      verify(
        () => mockUseCase.verifyAuthCode(
          sessionId: validSessionId,
          authCode: AuthCodeValue(validAuthCode),
        ),
      ).called(1);
    },
  );

  blocTest(
    '유효하지 않은 인증번호 입력 상태에서 인증 버튼 눌렀을 때 테스트',
    build: () {
      return phoneAuthBloc..emit(
        PhoneAuthState(
          status: BaseBlocStatus.initial(),
          sessionId: validSessionId,
          authCode: AuthCodeValue(invalidAuthCode),
        ),
      );
    },
    act: (bloc) => bloc.add(PhoneAuthVerifyRequested()),
    expect: () => [],
    verify: (_) {
      verifyNever(
        () => mockUseCase.verifyAuthCode(
          sessionId: validSessionId,
          authCode: AuthCodeValue(invalidAuthCode),
        ),
      ); // 인증 코드 검증 함수가 호출되지 않음을 확인
    },
  );
}
