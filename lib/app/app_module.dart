import 'package:customer/app/modules/auth/auth_module.dart';
import 'package:customer/app/modules/auth/guards/auth_guard.dart';
import 'package:customer/app/modules/home/home_module.dart';
import 'package:customer/app/splash_screen.dart';
import 'package:customer/app/stores/user_store.dart';
import 'package:customer/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => UserStore(), export: true),
      ];

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/splash', child: (context, args) => SplashScreenPage()),
        ModuleRoute('/home', module: HomeModule(), guards: [AuthGuard()]),
        ModuleRoute('/auth', module: AuthModule()),
      ];
}
