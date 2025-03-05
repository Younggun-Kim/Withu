import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:withu/feature/common/data/data_source/remote/api.dart';

class CommonMockApi extends CommonApiImpl {
  CommonMockApi({required super.network}) {
    dioAdapter = DioAdapter(dio: network.dio);
  }

  late final DioAdapter dioAdapter;
}
