import 'package:customer/shared/stores/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SharedModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => UserStore(), export: true),
      ];
}
