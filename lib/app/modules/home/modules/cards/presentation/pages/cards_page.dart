import 'dart:math';

import 'package:customer/app/modules/home/modules/cards/presentation/controllers/cards_controller.dart';
import 'package:customer/app/modules/home/modules/cards/presentation/widgets/card_widget.dart';
import 'package:customer/shared/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final UserStore _userStore = Modular.get<UserStore>();
  final CardsController _cardsController = Modular.get<CardsController>();

  List<int> data = [];

  @override
  void initState() {
    super.initState();

    _cardsController.fetchUserCards();

    for (int i = 0; i < 10; i++) {
      data.add(Random().nextInt(100) + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  height: constraints.maxHeight * 0.15,
                  // child: Text(
                  //   "Olá, ${_userStore.user!.firstName}",
                  //   style: TextStyle(
                  //       color: Theme.of(context).colorScheme.primary,
                  //       fontSize: 32,
                  //       fontWeight: FontWeight.w500),
                  // ),
                ),
                Expanded(
                  child: ScrollSnapList(
                    onItemFocus: (_) => {},
                    itemSize: constraints.maxWidth / 1.30,
                    itemBuilder: (context, index) =>
                        CardWidget(constraints: constraints),
                    itemCount: data.length,
                    dynamicItemSize: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
