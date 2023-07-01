import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CardWidgetPoint extends StatelessWidget {
  final bool selected;

  const CardWidgetPoint({super.key, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: selected
          ? Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5.0),
              ),
            )
          : null,
    );
  }
}

class CardWidget extends StatelessWidget {
  final BoxConstraints constraints;

  const CardWidget({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            "https://firebasestorage.googleapis.com/v0/b/fidelin-b1ad0.appspot.com/o/cards%2F2.png?alt=media&token=eec7dc73-898a-4eac-b244-1a90dd7d95d8",
          ),
        ),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.black26,
      ),
      width: constraints.maxWidth / 1.30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: new Icon(
                  MdiIcons.informationOutline,
                  color: Colors.white,
                ),
                onPressed: () {
                  // ...
                },
              ),
              Text("1/16",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600)),
              IconButton(
                icon: new Icon(
                  MdiIcons.dotsVertical,
                  color: Colors.white,
                ),
                onPressed: () {
                  // ...
                },
              ),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 48, // Image radius
                backgroundImage: NetworkImage(
                    'https://png.pngtree.com/png-vector/20220825/ourlarge/pngtree-beauty-logo-png-image_6123760.png'),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Salão Belíssima",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              reverse: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 5,
              children: [
                CardWidgetPoint(
                  selected: true,
                ),
                CardWidgetPoint(selected: true),
                CardWidgetPoint(selected: true),
                CardWidgetPoint(selected: true),
                CardWidgetPoint(),
                CardWidgetPoint(),
                CardWidgetPoint(),
                CardWidgetPoint(),
                CardWidgetPoint(),
                CardWidgetPoint(),
                CardWidgetPoint(),
                CardWidgetPoint(),
                CardWidgetPoint(),
                CardWidgetPoint(),
                CardWidgetPoint(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.white,
                ),
                onPressed: () {
                  // ...
                },
              ),
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                ),
                onPressed: () {
                  // ...
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                onPressed: () {
                  // ...
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
