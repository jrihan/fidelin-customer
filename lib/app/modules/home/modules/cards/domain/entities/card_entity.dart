import 'dart:ui';

import 'package:customer/app/modules/home/modules/cards/domain/entities/reward_entity.dart';
import 'package:customer/app/modules/home/modules/cards/domain/entities/store_entity.dart';
import 'package:mobx/mobx.dart';

class CardEntity {
  final String id;
  final DateTime expiration;
  final List<String> points;
  final Color color;
  final String logoUrl;
  final int maxPoints;
  final RewardEntity reward;
  final StoreEntity store;

  CardEntity({
    required this.id,
    required this.expiration,
    required this.points,
    required this.color,
    required this.logoUrl,
    required this.maxPoints,
    required this.reward,
    required this.store,
  });
}
