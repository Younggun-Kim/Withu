import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/domain/entity/validate_business/validate_business_entity.dart';
import 'package:withu/feature/common/domain/repository/repository.dart';

abstract class ValidateBusinessUseCase {
  final CommonRepository commonRepo;
  final AccountRepository accountRepo;

  ValidateBusinessUseCase({
    required this.commonRepo,
    required this.accountRepo,
  });

  /// 중복확인
  Future<bool> checkDuplication(ValidateBusinessEntity entity);

  /// 저장된 Sns 회원가입 정보 가져오기
  Future<StoredSnsSignUpValue> getStoredSnsSignUpData();
}

class ValidateBusinessUseCaseImpl implements ValidateBusinessUseCase {
  @override
  final CommonRepository commonRepo;

  @override
  final AccountRepository accountRepo;

  ValidateBusinessUseCaseImpl({
    required this.commonRepo,
    required this.accountRepo,
  });

  @override
  Future<bool> checkDuplication(ValidateBusinessEntity entity) async {
    return await commonRepo.checkBusinessNumDuplication(entity.toDto());
  }

  @override
  Future<StoredSnsSignUpValue> getStoredSnsSignUpData() async {
    return await accountRepo.getStoredSnsSignUpData();
  }
}
