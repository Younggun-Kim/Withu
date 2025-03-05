import 'package:withu/feature/common/domain/repository/repository.dart';

abstract class ValidateBusinessUseCase {
  final CommonRepository commonRepo;

  ValidateBusinessUseCase({required this.commonRepo});
}

class ValidateBusinessUseCaseImpl implements ValidateBusinessUseCase {
  @override
  final CommonRepository commonRepo;

  ValidateBusinessUseCaseImpl({required this.commonRepo});
}
