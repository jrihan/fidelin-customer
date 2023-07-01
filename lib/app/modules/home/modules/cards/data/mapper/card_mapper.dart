import 'package:customer/app/modules/home/modules/cards/data/dto/card_dto.dart';
import 'package:customer/app/modules/home/modules/cards/data/mapper/reward_mapper.dart';
import 'package:customer/app/modules/home/modules/cards/data/mapper/store_mapper.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/card_entity.dart';

class CardMapper {
  static CardEntity mapDTOtoEntity(CardDTO dto) {
    return CardEntity(
      id: dto.id,
      expiration: dto.expiration,
      points: dto.points,
      color: dto.color,
      logoUrl: dto.logoUrl,
      maxPoints: dto.maxPoints,
      backgroundUrl: dto.backgroundUrl,
      reward: RewardMapper.mapDTOtoEntity(dto.reward),
      store: StoreMapper.mapDTOtoEntity(dto.storeId),
    );
  }
}
