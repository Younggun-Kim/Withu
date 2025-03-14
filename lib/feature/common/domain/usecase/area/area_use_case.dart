import 'dart:async';

import 'package:withu/feature/common/domain/entity/area/area_entity.dart';
import 'package:withu/feature/common/domain/repository/repository.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

abstract class AreaUseCase {
  final CommonRepository commonRepo;

  AreaUseCase({required this.commonRepo});

  FutureOr<List<AreaEntity>> getSido();

  FutureOr<List<AreaEntity>> getSgg(AreaEntity sido);

  FutureOr<List<AreaEntity>> getEmd(AreaEntity sgg);
}

class AreaUseCaseImpl implements AreaUseCase {
  @override
  final CommonRepository commonRepo;

  AreaUseCaseImpl({required this.commonRepo});

  @override
  FutureOr<List<AreaEntity>> getSido() async {
    final response = await commonRepo.getSido();

    if (!response.success) {
      Toast.showWithNavigatorKey(text: response.message);
      return [];
    }
    return AreaEntityParser.fromDto(response);
  }

  @override
  FutureOr<List<AreaEntity>> getSgg(AreaEntity sido) async {
    final response = await commonRepo.getSgg(sido.cd);

    if (!response.success) {
      Toast.showWithNavigatorKey(text: response.message);
      return [];
    }
    return AreaEntityParser.fromDto(response);
  }

  @override
  FutureOr<List<AreaEntity>> getEmd(AreaEntity sgg) async {
    final response = await commonRepo.getEmd(sgg.cd);

    if (!response.success) {
      Toast.showWithNavigatorKey(text: response.message);
      return [];
    }
    return AreaEntityParser.fromDto(response);
  }
}
