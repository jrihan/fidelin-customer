import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:customer/app/modules/home/modules/cards/data/dto/card_dto.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/card_entity.dart';

abstract class CardsDataSource {
  Future<List<CardDTO>> fetchCards();
}
