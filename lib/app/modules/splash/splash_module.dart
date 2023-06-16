import 'package:customer/app/app_module.dart';
import 'package:customer/app/modules/splash/splash_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [AppModule()];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SplashScreenPage()),
      ];
}
