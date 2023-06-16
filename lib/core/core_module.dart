import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => FirebaseFirestore.instance, export: true),
        Bind.lazySingleton((i) => FirebaseAuth.instance, export: true),
      ];
}
