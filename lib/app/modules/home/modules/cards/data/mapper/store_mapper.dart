import 'package:customer/app/modules/home/modules/cards/data/dto/store_dto.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/store_entity.dart';

class ContactsMapper {
  static Contacts mapDTOtoEntity(ContactsDTO dto) {
    return Contacts(
        instagram: dto.instagram,
        site: dto.site,
        phone: dto.phone,
        whatsapp: dto.whatsapp);
  }
}

class StoreMapper {
  static StoreEntity mapDTOtoEntity(StoreDTO dto) {
    return StoreEntity(
      id: dto.id,
      name: dto.name,
      avatarUrl: dto.avatarUrl,
      email: dto.email,
      contacts: ContactsMapper.mapDTOtoEntity(dto.contacts),
    );
  }
}
