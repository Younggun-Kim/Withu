import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:withu/feature/common/common.dart';

class MockCommonRepository extends Mock implements CommonRepository {}

void main() {
  late MockCommonRepository mockRepo;
  late PhoneAuthUseCase useCase;

  setUpAll(() {});

  setUp(() {
    mockRepo = MockCommonRepository();
    useCase = PhoneAuthUseCaseImpl(commonRepo: mockRepo);
  });

  // group('휴대폰 번호 인증 테스트', () {
  //   test('휴대폰 번호 인증번호 전송 - 성공 케이스', () async {
  //     // Given
  //     const phone = '01012345678';
  //     final expectDto = SendAuthCodeResponseDtoMock.success();
  //
  //     when(
  //       () => mockRepo.sendAuthCode(phone: phone),
  //     ).thenAnswer((_) async => ApiResponse.success(expectDto));
  //
  //     // When
  //     final result = await useCase.sendAuthCode(phone: phone);
  //
  //     // Then
  //     expect(result, equals(SendAuthCodeResultEntityParser.fromDto(expectDto)));
  //     verify(() => mockRepo.sendAuthCode(phone: phone)).called(1);
  //   });
  //
  //   test('휴대폰 번호 인증번호 전송 - 실패 케이스', () async {
  //     // Given
  //     final expectDto = FailResponse.error();
  //
  //     when(
  //       () => mockRepo.sendAuthCode(phone: any(named: 'phone')),
  //     ).thenAnswer((_) async => ApiResponse.fail(expectDto));
  //
  //     // When
  //     final result = await useCase.sendAuthCode(phone: '01012345678');
  //
  //     // Then
  //     expect(result.status, isFalse);
  //     expect(result.message, StringRes.serverError.tr);
  //     verify(() => mockRepo.sendAuthCode(phone: any(named: 'phone'))).called(1);
  //   });
  // });
}
