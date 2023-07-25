import 'package:customer/app/modules/home/modules/cards/data/dto/card_dto.dart';

abstract class CardsDataSource {
  Future<List<CardDTO>> fetchCards();
}
