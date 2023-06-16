import 'package:customer/app/modules/home/modules/cards/data/datasources/cards_datasource.dart';
import 'package:customer/app/modules/home/modules/cards/data/dto/card_dto.dart';
import 'package:customer/app/modules/home/modules/cards/data/mapper/card_mapper.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/card_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/home/modules/cards/domain/repositories/cards_repository.dart';

class CardsRepositoryImpl implements CardsRepository {
  CardsDataSource _dataSource;

  CardsRepositoryImpl({required CardsDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Exception, List<CardEntity>>> fetchCards() async {
    try {
      final result = await _dataSource.fetchCards();
      return right(
        result.map((CardDTO card) => CardMapper.mapDTOtoEntity(card)).toList(),
      );
    } on Exception catch (e) {
      return left(Exception("Erro Inesperado"));
    }
  }
}
