import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/app/modules/home/modules/cards/data/datasources/firebase_datasource_impl.dart';
import 'package:customer/app/modules/home/modules/cards/data/repositories/cards_repository_impl.dart';
import 'package:customer/app/modules/home/modules/cards/domain/usecases/fetch_cards_usecase.dart';
import 'package:customer/app/modules/home/modules/cards/presentation/pages/cards_page.dart';
import 'package:customer/app/modules/home/modules/profile/presentation/pages/profile_page.dart';
import 'package:customer/app/modules/home/home_widget.dart';
import 'package:customer/app/modules/home/modules/qrcode/data/datasources/qrcode_datasource.dart';
import 'package:customer/app/modules/home/modules/qrcode/data/datasources/qrcode_datasource_impl.dart';
import 'package:customer/app/modules/home/modules/qrcode/data/repositories/qrcode_repository_impl.dart';
import 'package:customer/app/modules/home/modules/qrcode/domain/usecases/add_point_usecase.dart';
import 'package:customer/app/modules/home/modules/qrcode/presentation/controller/qrcode_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/cards/data/datasources/cards_datasource.dart';
import 'modules/cards/presentation/controllers/cards_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        //Card
        Bind.factory<CardsDataSource>((i) =>
            FirebaseDataSourceImpl(i<FirebaseFirestore>(), i<FirebaseAuth>())),
        Bind.factory((i) => CardsRepositoryImpl(dataSource: i())),
        Bind.factory((i) => FetchCardsUseCaseImpl(repository: i())),
        Bind.singleton((i) => CardsController(fetchCardsUseCase: i())),

        //QrCode
        Bind.factory<QrCodeDataSource>((i) =>
            QrCodeDataSourceImpl(i<FirebaseFirestore>(), i<FirebaseAuth>())),
        Bind.factory((i) => QrCodeRepositoryImpl(dataSource: i())),
        Bind.factory((i) => AddPointUseCaseImpl(repository: i())),
        Bind.singleton((i) => QrCodeController(addPointUseCase: i())),
      ];

  @override
  List<Module> get imports => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
          children: [
            ChildRoute(
              '/cards',
              child: (context, args) => CardsPage(),
            ),
            ChildRoute(
              '/profile',
              child: (context, args) => const ProfilePage(),
            )
          ],
        ),
      ];
}
