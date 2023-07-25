import 'package:cloud_firestore/cloud_firestore.dart';

class PointDTO {
  String id;
  String cardId;
  String? userId;
  DateTime? expiration;
  bool used;

  PointDTO({
    required this.id,
    required this.cardId,
    required this.userId,
    required this.expiration,
    required this.used,
  });

  Map<String, dynamic> toMap() {
    return {
      'card_id': cardId,
      'user_id': userId,
      'expiration': expiration,
      'used': used,
    };
  }

  factory PointDTO.fromSnapshot(DocumentSnapshot doc) {
    return PointDTO(
      id: doc.id,
      cardId:
          doc.data().toString().contains('card_id') ? doc.get('card_id') : '',
      userId:
          doc.data().toString().contains('user_id') ? doc.get('user_id') : '',
      expiration: doc.data().toString().contains('expiration')
          ? (doc.get('expiration') as Timestamp).toDate()
          : DateTime.now(),
      used: doc.data().toString().contains('used') ? doc.get('used') : false,
    );
  }
}
