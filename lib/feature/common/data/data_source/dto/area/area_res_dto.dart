import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'area_res_dto.freezed.dart';

part 'area_res_dto.g.dart';

typedef AreaResDto = BaseResponseDto<List<AreaResData>>;

/// 지역 응답 모델
@freezed
class AreaResData with _$AreaResData {
  factory AreaResData({
    required String cd,
    required String addrName,
    required String fullAddr,
    required String level,
    required String xcoor,
    required String ycoor,
    @Default('') String sessionId,
  }) = _AreaResData;

  factory AreaResData.fromJson(Map<String, dynamic> json) =>
      _$AreaResDataFromJson(json);
}

extension AreaResDtoMock on AreaResDto {
  static AreaResDto sido() {
    return AreaResDto(
      success: true,
      message: '시/도 목록이 조회되었습니다.',
      data: [
        AreaResData(
          cd: "11",
          addrName: "서울특별시",
          fullAddr: "서울특별시",
          level: "CITY",
          xcoor: "953932",
          ycoor: "1952053",
        ),
      ],
      errorCode: '',
    );
  }

  static AreaResDto sgg() {
    return AreaResDto(
      success: true,
      message: '시/군/구 목록이 조회되었습니다.',
      data: [
        AreaResData(
          cd: "11230",
          addrName: "강남구",
          fullAddr: "서울특별시 강남구",
          level: "DISTRICT",
          xcoor: "961366",
          ycoor: "1944250",
        ),
      ],
      errorCode: '',
    );
  }

  static AreaResDto emd() {
    return AreaResDto(
      success: true,
      message: '읍/면/동 목록이 조회되었습니다.',
      data: [
        AreaResData(
          cd: "11230680",
          addrName: "개포1동",
          fullAddr: "서울특별시 강남구 개포1동",
          level: "DONG",
          xcoor: "961300",
          ycoor: "1942155",
        ),
      ],
      errorCode: '',
    );
  }
}
