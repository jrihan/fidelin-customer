import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/card_entity.dart';
import 'package:customer/app/modules/home/modules/cards/domain/usecases/fetch_cards_usecase.dart';
import 'package:mobx/mobx.dart';

part 'cards_controller.g.dart';

class CardsController = _CardsControllerBase with _$CardsController;

abstract class _CardsControllerBase with Store {
  late FetchCardsUseCase _fetchCardsUseCase;

  _CardsControllerBase({required FetchCardsUseCase fetchCardsUseCase}) {
    _fetchCardsUseCase = fetchCardsUseCase;
  }

  @observable
  ObservableList<CardEntity> cards = ObservableList<CardEntity>();

  @action
  Future<void> fetchUserCards() async {
    final Either<Exception, List<CardEntity>> _response =
        await _fetchCardsUseCase.call();
    _response.fold(
      (Exception e) {
        print("error");
      },
      (List<CardEntity> listOfCards) {
        cards.clear();
        cards.addAll(listOfCards);
      },
    );
  }
}
