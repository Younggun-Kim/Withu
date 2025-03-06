import 'package:withu/feature/common/domain/entity/validate_business_entity.dart';
import 'package:withu/feature/common/domain/repository/repository.dart';

abstract class ValidateBusinessUseCase {
  final CommonRepository commonRepo;

  ValidateBusinessUseCase({required this.commonRepo});

  /// 중복확인
  Future<bool> checkDuplication(ValidateBusinessEntity entity);
}

class ValidateBusinessUseCaseImpl implements ValidateBusinessUseCase {
  @override
  final CommonRepository commonRepo;

  ValidateBusinessUseCaseImpl({required this.commonRepo});

  @override
  Future<bool> checkDuplication(ValidateBusinessEntity entity) async {
    return await commonRepo.checkDuplication(entity.toDto());
  }
}
