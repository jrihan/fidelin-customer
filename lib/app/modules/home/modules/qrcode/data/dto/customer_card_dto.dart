import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerCardDTO {
  final String id;
  final String cardId;
  final String userId;
  final DateTime? expiration;
  List<String> points;

  CustomerCardDTO({
    this.id = '',
    required this.cardId,
    required this.userId,
    this.expiration,
    required this.points,
  });

  Map<String, dynamic> toMap() {
    return {
      'card_id': cardId,
      'user_id': userId,
      'points': points,
    };
  }

  factory CustomerCardDTO.fromSnapshot(DocumentSnapshot doc) {
    return CustomerCardDTO(
      id: doc.id,
      cardId:
          doc.data().toString().contains('card_id') ? doc.get('card_id') : '',
      userId:
          doc.data().toString().contains('user_id') ? doc.get('user_id') : '',
      expiration: doc.data().toString().contains('expiration')
          ? (doc.get('expiration') as Timestamp).toDate()
          : DateTime.now(),
      points: doc.data().toString().contains('points')
          ? (doc.get('points') as List<dynamic>)
              .map((e) => e.toString())
              .toList()
          : [],
    );
  }
}
