import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'stores/user_store.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key}) {
    Modular.get<UserStore>().check().then((v) {
      return Future.delayed(const Duration(seconds: 2));
    }).then((value) {
      Modular.to.pushNamedAndRemoveUntil("/home", (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
