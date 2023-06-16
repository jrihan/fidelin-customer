import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/card_entity.dart';
import 'package:customer/app/modules/home/modules/cards/domain/repositories/cards_repository.dart';

abstract class FetchCardsUseCase {
  Future<Either<Exception, List<CardEntity>>> call();
}

class FetchCardsUseCaseImpl implements FetchCardsUseCase {
  final CardsRepository _repository;

  FetchCardsUseCaseImpl({required CardsRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, List<CardEntity>>> call() {
    return _repository.fetchCards();
  }
}
