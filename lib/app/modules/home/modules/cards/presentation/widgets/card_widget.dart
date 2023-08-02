import 'package:customer/app/modules/home/modules/cards/domain/entities/card_entity.dart';
import 'package:customer/app/modules/home/modules/cards/presentation/controllers/cards_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class CardWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final int index;

  const CardWidget({super.key, required this.index, required this.constraints});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final CardsController _cardsController = Modular.get<CardsController>();

  late CardEntity card;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    card = _cardsController.cards[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            card.backgroundUrl,
          ),
        ),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.black26,
      ),
      width: widget.constraints.maxWidth / 1.20,
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
              Text("${card.points.length}/${card.maxPoints}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600)),
              PopupMenuButton(
                icon: new Icon(
                  MdiIcons.dotsVertical,
                  color: Colors.white,
                ),
                itemBuilder: (ctx) => [
                  _buildPopupMenuItem('Excluir'),
                ],
              )
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 48, // Image radius
                backgroundImage: NetworkImage(card.logoUrl),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                card.store.name,
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          // Expanded(
          //   child: GridView.count(
          //     physics: const NeverScrollableScrollPhysics(),
          //     primary: false,
          //     reverse: false,
          //     padding: const EdgeInsets.all(20),
          //     crossAxisSpacing: 15,
          //     mainAxisSpacing: 15,
          //     crossAxisCount: 5,
          //     children: [
          //       CardWidgetPoint(
          //         selected: true,
          //       ),
          //       CardWidgetPoint(selected: true),
          //       CardWidgetPoint(selected: true),
          //       CardWidgetPoint(selected: true),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //       CardWidgetPoint(),
          //     ],
          //   ),
          // ),
          Expanded(
            child: GridView.builder(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemCount: card.maxPoints,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: card.maxPoints % 2 == 0 ? 4 : 5,
                  mainAxisSpacing: card.maxPoints % 2 == 0 ? 15 : 10,
                  crossAxisSpacing: card.maxPoints % 2 == 0 ? 15 : 10,
                ),
                itemBuilder: (BuildContext context, int index) =>
                    CardWidgetPoint(
                      selected: card.points.length > index,
                    )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: card.store.contacts.whatsapp,
                child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    final Uri url = Uri.parse(
                        "https://wa.me/${card.store.contacts.phone}?text=Olá!");
                    _launchUrl(url);
                  },
                ),
              ),
              Visibility(
                visible: card.store.contacts.instagram.isNotEmpty,
                child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    final Uri nativeUrl = Uri.parse(
                        "instagram://user?username=${card.store.contacts.instagram}");
                    final Uri webUrl = Uri.parse(
                        "https://www.instagram.com/${card.store.contacts.instagram}/");
                    if (await canLaunchUrl(nativeUrl)) {
                      await _launchUrl(nativeUrl);
                    } else if (await canLaunchUrl(webUrl)) {
                      await _launchUrl(webUrl);
                    } else {
                      print("can't open Instagram");
                    }
                  },
                ),
              ),
              Visibility(
                visible: card.store.contacts.phone.isNotEmpty,
                child: IconButton(
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: '+5581996509220',
                    );
                    _launchUrl(launchUri);
                  },
                ),
              ),
              Visibility(
                visible: card.store.contacts.site.isNotEmpty,
                child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.globe,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    final Uri url = Uri.parse(card.store.contacts.site);
                    _launchUrl(url);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

PopupMenuItem _buildPopupMenuItem(String title) {
  return PopupMenuItem(
    child: Text(title),
  );
}
