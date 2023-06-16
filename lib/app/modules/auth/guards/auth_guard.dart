import 'package:customer/shared/stores/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth');

  @override
  bool canActivate(String path, ModularRoute router) {
    return Modular.get<UserStore>().isLogged;
  }
}
