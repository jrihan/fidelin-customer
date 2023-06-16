import 'dart:ui';

import 'package:customer/app/modules/home/modules/cards/domain/entities/reward_entity.dart';

class CardEntity {
  final String id;
  final String storeId;
  final DateTime expiration;
  final List<String> points;
  final Color color;
  final String logoUrl;
  final int maxPoints;
  final RewardEntity reward;

  CardEntity({
    required this.id,
    required this.storeId,
    required this.expiration,
    required this.points,
    required this.color,
    required this.logoUrl,
    required this.maxPoints,
    required this.reward,
  });
}
