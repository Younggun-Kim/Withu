import 'package:withu/feature/common/data/data_source/remote/api.dart';

abstract class CommonRepository {
  final CommonApi commonApi;

  CommonRepository({required this.commonApi});
}
