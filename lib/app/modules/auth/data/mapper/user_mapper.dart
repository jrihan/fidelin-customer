import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:customer/app/modules/auth/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity mapDTOtoEntity(UserDTO dto) {
    return UserEntity(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      phone: dto.phone,
      gender: dto.gender,
      avatarUrl: dto.avatarUrl,
    );
  }

  // static UserDTO mapEntityToDTO(UserEntity entity) {
  //   return UserDTO(
  //     id: entity.id,
  //     firstName: entity.firstName,
  //     lastName: entity.lastName,
  //     email: entity.email,
  //     phone: entity.phone,
  //     gender: entity.gender,
  //     avatarUrl: entity.avatarUrl,
  //   );
  // }
}
