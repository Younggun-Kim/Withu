import 'package:freezed_annotation/freezed_annotation.dart';

/// 프로필 등록 여부
@JsonEnum(valueField: 'serverKey')
enum ProfileStatusType {
  none(serverKey: ''),
  complete(serverKey: 'COMPLETE'),
  incomplete(serverKey: 'INCOMPLETE');

  final String serverKey;

  const ProfileStatusType({required this.serverKey});

  static List<ProfileStatusType> get valuesWithoutNone =>
      values.where((type) => !type.isNone).toList();

  bool get isNone => this == none;
}
