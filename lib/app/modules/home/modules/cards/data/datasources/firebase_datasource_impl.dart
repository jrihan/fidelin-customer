import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:customer/app/modules/home/modules/cards/data/datasources/cards_datasource.dart';
import 'package:customer/app/modules/home/modules/cards/data/dto/card_dto.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/card_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'cards_datasource.dart';

class FirebaseDataSourceImpl implements CardsDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  CollectionReference get costumerCardsCollection =>
      firestore.collection('customer_cards');

  CollectionReference get cardsCollection => firestore.collection('cards');

  FirebaseDataSourceImpl(this.firestore, this.auth);

  @override
  Future<List<CardDTO>> fetchCards() async {
    try {
      List<CardDTO> cards = [];

      final snapshot = await costumerCardsCollection
          .where("user_id", isEqualTo: auth.currentUser!.uid)
          .get();

      for (QueryDocumentSnapshot userCardDoc in snapshot.docs) {
        var cardDoc =
            await cardsCollection.doc(userCardDoc.get('card_id')).get();

        cards.add(CardDTO.fromSnapshot(userCardDoc, cardDoc));
      }

      return cards;
    } catch (e) {
      rethrow;
    }
  }
}
