import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/app/modules/home/modules/qrcode/data/datasources/qrcode_datasource.dart';
import 'package:customer/app/modules/home/modules/qrcode/data/dto/customer_card_dto.dart';
import 'package:customer/app/modules/home/modules/qrcode/data/dto/point_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QrCodeDataSourceImpl extends QrCodeDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  CollectionReference get pointsCollection => firestore.collection('points');

  CollectionReference get cardCollection => firestore.collection('cards');
  CollectionReference get costumerCardsCollection =>
      firestore.collection('customer_cards');

  QrCodeDataSourceImpl(this.firestore, this.auth);

  @override
  Future<void> addPoint(String pointId) async {
    try {
      final pointSnapshot = await pointsCollection.doc(pointId).get();

      final custumerCardSnapshot = await costumerCardsCollection
          .where("user_id", isEqualTo: auth.currentUser?.uid)
          .where("card_id", isEqualTo: pointSnapshot.get('card_id'))
          .get();

      final PointDTO pointDTO = PointDTO.fromSnapshot(pointSnapshot);
      final CustomerCardDTO customerCardDTO =
          CustomerCardDTO.fromSnapshot(custumerCardSnapshot.docs.first);

      if (!pointDTO.used && pointDTO.userId == "") {
        pointDTO.userId = auth.currentUser?.uid;
        pointDTO.used = true;

        customerCardDTO.points.add(pointDTO.id);

        pointsCollection.doc(pointId).update(pointDTO.toMap());
        costumerCardsCollection
            .doc(customerCardDTO.id)
            .update(customerCardDTO.toMap());
      }
    } catch (e) {
      rethrow;
    }
  }
}
