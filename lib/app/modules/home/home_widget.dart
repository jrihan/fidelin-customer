import 'package:customer/app/modules/home/modules/cards/presentation/pages/cards_page.dart';
import 'package:customer/app/modules/home/modules/profile/presentation/pages/profile_page.dart';
import 'package:customer/app/modules/home/modules/qrcode/presentation/qrcoder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
    _pages = [
      CardsPage(),
      const QrCodePage(),
      const ProfilePage(),
    ];

    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _pages,
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  void _tapHandler(int index) {
    setState(() {
      _selectedPageIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  Widget bottomNavigationBar() {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, snapshot) => Container(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => _tapHandler(0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Icon(
                  Icons.home,
                  color: _selectedPageIndex == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black45,
                ),
              ),
            ),
            InkWell(
              onTap: () => _tapHandler(1),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFFF00D6),
                        Color(0xFFFF4D00),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Icon(Icons.qr_code, color: Colors.white),
              ),
            ),
            InkWell(
              onTap: () => _tapHandler(2),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Icon(
                  Icons.person,
                  color: _selectedPageIndex == 2
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black45,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
