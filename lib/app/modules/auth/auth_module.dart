import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:customer/app/modules/auth/data/datasources/firebase_datasource_impl.dart';
import 'package:customer/app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:customer/app/modules/auth/domain/usecases/signin_with_email_usecase.dart';
import 'package:customer/app/modules/auth/domain/usecases/signup_with_email_usercase.dart';
import 'package:customer/app/modules/auth/presentation/controllers/signin_controller.dart';
import 'package:customer/app/modules/auth/presentation/pages/signin_page.dart';
import 'package:customer/app/modules/auth/presentation/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<AuthDataSource>(
            (i) => FirebaseDataSourceImpl(
                i<FirebaseFirestore>(), i<FirebaseAuth>()),
            export: false),
        Bind.factory((i) => AuthRepositoryImpl(dataSource: i())),
        Bind.factory((i) => SignInWithEmailUseCaseImpl(repository: i())),
        Bind.factory((i) => SignUpWithEmailUseCaseImpl(repository: i())),
        Bind.singleton((i) => SignInController(
            signInWithEmailUseCase: i(), signUpWithEmailUseCase: i())),
      ];

  @override
  List<Module> get imports => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SignInPage()),
        ChildRoute('/signup', child: (context, args) => const SignUpPage()),
      ];
}
