import 'package:withu/feature/common/common.dart';

class CommonRepositoryImpl implements CommonRepository {
  @override
  final CommonApi commonApi;

  CommonRepositoryImpl({required this.commonApi});

  @override
  Future<bool> checkDuplication(ValidateBusinessReqDto dto) async {
    final response = await commonApi.postValidateBusiness(dto);

    return response.maybeWhen(
      success: (ValidateBusinessResDto response) {
        return response.isRegistered;
      },
      orElse: () => false,
    );
  }
}
