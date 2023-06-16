import 'package:customer/app/modules/home/modules/cards/data/dto/reward_dto.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/reward_entity.dart';

class RewardMapper {
  static RewardEntity mapDTOtoEntity(RewardDTO dto) {
    return RewardEntity(title: dto.title, imageUrl: dto.imageUrl);
  }
}
