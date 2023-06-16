import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'reward_dto.dart';

class CardDTO {
  final String id;
  final String cardId;
  final String storeId;
  final DateTime expiration;
  final List<String> points;
  final Color color;
  final String logoUrl;
  final int maxPoints;
  final RewardDTO reward;

  CardDTO({
    required this.id,
    required this.cardId,
    required this.storeId,
    required this.expiration,
    required this.points,
    required this.color,
    required this.logoUrl,
    required this.maxPoints,
    required this.reward,
  });

  factory CardDTO.fromSnapshot(
      DocumentSnapshot userCardDoc, DocumentSnapshot cardDoc) {
    return CardDTO(
      id: userCardDoc.id,
      cardId: cardDoc.id,
      storeId: cardDoc.data().toString().contains('store_id')
          ? cardDoc.get('store_id')
          : '',
      expiration: userCardDoc.data().toString().contains('expiration')
          ? (userCardDoc.get('expiration') as Timestamp).toDate()
          : DateTime.now(),
      points: (userCardDoc.get('points') as List<dynamic>).map((e) {
        return e.toString();
      }).toList(),
      color: userCardDoc.data().toString().contains('expiration')
          ? Color.fromARGB(
              (cardDoc.get('color') as Map<String, dynamic>)["a"],
              (cardDoc.get('color') as Map<String, dynamic>)["r"],
              (cardDoc.get('color') as Map<String, dynamic>)["g"],
              (cardDoc.get('color') as Map<String, dynamic>)["b"],
            )
          : const Color(0x00000000),
      logoUrl: cardDoc.data().toString().contains('expiration')
          ? cardDoc.get('expiration')
          : '',
      maxPoints: cardDoc.data().toString().contains('expiration')
          ? cardDoc.get('expiration') as int
          : 0,
      reward: RewardDTO.fromSnapshot(
        cardDoc.get('reward'),
      ),
    );
  }
}
