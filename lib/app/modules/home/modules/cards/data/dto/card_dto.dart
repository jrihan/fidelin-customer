import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/app/modules/home/modules/cards/data/dto/store_dto.dart';
import 'package:flutter/material.dart';

import 'reward_dto.dart';

class CardDTO {
  final String id;
  final String cardId;
  final StoreDTO storeId;
  final DateTime? expiration;
  final List<String> points;
  final Color color;
  final String logoUrl;
  final int maxPoints;
  final RewardDTO reward;
  final String backgroundUrl;

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
    required this.backgroundUrl,
  });

  factory CardDTO.fromSnapshot(DocumentSnapshot userCardDoc,
      DocumentSnapshot cardDoc, DocumentSnapshot storeDoc) {
    return CardDTO(
      id: userCardDoc.id,
      cardId: cardDoc.id,
      storeId: StoreDTO.fromSnapshot(storeDoc),
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
      logoUrl: cardDoc.data().toString().contains('logo_url')
          ? cardDoc.get('logo_url')
          : '',
      maxPoints: cardDoc.data().toString().contains('max_points')
          ? cardDoc.get('max_points') as int
          : 0,
      reward: RewardDTO.fromSnapshot(
        cardDoc.get('reward'),
      ),
      backgroundUrl: cardDoc.data().toString().contains('background_url')
          ? cardDoc.get('background_url')
          : '',
    );
  }
}
