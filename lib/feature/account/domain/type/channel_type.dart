import 'package:freezed_annotation/freezed_annotation.dart';

/// 성별 타입
@JsonEnum(valueField: 'serverKey')
enum ChannelType {
  none(serverKey: ''),

  /// 인터넷 검색
  search(serverKey: 'INTERNET_SEARCH'),

  /// SNS 광고
  sns(serverKey: 'SNS_AD'),

  /// 지인 추천
  acquaintance(serverKey: 'FRIEND_REFERRAL'),

  /// 인스타 계정
  instagram(serverKey: 'INSTAGRAM'),

  /// 블로그
  blog(serverKey: 'BLOG'),

  /// 기타
  other(serverKey: 'OTHER');

  final String serverKey;

  const ChannelType({required this.serverKey});

  static List<ChannelType> get valuesWithoutNone =>
      values.where((type) => !type.isNone).toList();

  bool get isNone => this == none;

  @override
  String toString() {
    switch (this) {
      case ChannelType.none:
        return '';
      case ChannelType.search:
        return '인터넷 검색';
      case ChannelType.sns:
        return 'SNS 광고';
      case ChannelType.acquaintance:
        return '지인추천';
      case ChannelType.instagram:
        return 'With U 인스타계정';
      case ChannelType.blog:
        return '블로그';
      case ChannelType.other:
        return '기타';
    }
  }
}
