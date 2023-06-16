import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/card_entity.dart';

abstract class CardsRepository {
  Future<Either<Exception, List<CardEntity>>> fetchCards();
}
