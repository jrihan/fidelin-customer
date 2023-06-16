import 'package:customer/app/modules/home/modules/cards/domain/entities/card_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardWidget extends StatelessWidget {
  final CardEntity card;

  const CardWidget(this.card);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: card.color,
      height: 150.0,
      child: Column(
        children: [
          Text('id: ${card.id}'),
          Text('color: ${card.color}'),
          Text('logo_url: ${card.logoUrl}'),
          Text('max_points: ${card.maxPoints}'),
          Text('points: ${card.points.length}'),
        ],
      ),
    );
  }
}
