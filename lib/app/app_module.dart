import 'package:customer/app/modules/auth/auth_module.dart';
import 'package:customer/app/modules/auth/guards/auth_guard.dart';
import 'package:customer/app/modules/home/home_module.dart';
import 'package:customer/app/splash_screen.dart';
import 'package:customer/core/core_module.dart';
import 'package:customer/shared/shared_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [CoreModule(), SharedModule()];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/splash', child: (_, __) => SplashScreenPage()),
        ModuleRoute('/home', module: HomeModule(), guards: [AuthGuard()]),
        ModuleRoute('/auth', module: AuthModule()),
      ];
}
