import 'package:withu/feature/user/data/data_sources/dto/simple_user_dto.dart';

class SimpleUserEntity {

  SimpleUserEntity({
    required this.id,
    required this.name,
    required this.age,
    required this.profile,
  });
  /// id
  final String id;

  /// 이름
  final String name;

  /// 나이
  final int age;

  /// 프로필 이미지
  final String profile;
}

extension SimpleUserEntityExt on SimpleUserEntity {
  static SimpleUserEntity fromDto(SimpleUserDto dto) {
    return SimpleUserEntity(
      id: dto.id,
      name: dto.name,
      age: dto.age,
      profile: dto.profile,
    );
  }
}
