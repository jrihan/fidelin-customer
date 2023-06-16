import 'package:customer/app/modules/home/modules/cards/presentation/controllers/cards_controller.dart';
import 'package:customer/app/modules/home/modules/cards/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardsPage extends StatefulWidget {
  CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage>
    with AutomaticKeepAliveClientMixin<CardsPage> {
  @override
  bool get wantKeepAlive => true;

  final CardsController _controller = Modular.get<CardsController>();

  @override
  void initState() {
    super.initState();
    _controller.fetchUserCards();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Observer(
        builder: (context) => RefreshIndicator(
          onRefresh: () => _controller.fetchUserCards(),
          child: ListView.builder(
            itemCount: _controller.cards.length,
            itemBuilder: (context, index) {
              return CardWidget(_controller.cards[index]);
            },
          ),
        ),
      ),
    );
  }
}
