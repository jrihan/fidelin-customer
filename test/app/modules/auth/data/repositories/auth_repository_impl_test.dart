import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:customer/app/modules/auth/data/datasources/firebase_datasource_impl.dart';
import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:customer/app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:customer/app/modules/auth/domain/entities/user_entity.dart';
import 'package:customer/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthDataSource])
main() {
  final AuthDataSource datasource = MockAuthDataSource();
  final AuthRepository repository = AuthRepositoryImpl(dataSource: datasource);

  test("Should return Right -> UserEntity when SignInWithEmail is called",
      () async {
    when(datasource.signInWithEmail(
            email: 'test@mail.com', password: '12345678'))
        .thenAnswer(
      (_) async => const UserDTO(
        id: '0',
        firstName: 'firstName',
        lastName: 'lastName',
        email: 'email',
        phone: 'phone',
        gender: 'gender',
        avatarUrl: 'avatarUrl',
      ),
    );

    late UserEntity resultExpected;

    final result = await repository
        .signInWithEmail(email: 'test@mail.com', password: '12345678')
        .then(
          (value) => value.fold((_) => null, (r) => r),
        );

    expect(result, isA<UserEntity>());
    expect(result?.id, "0");
  });

  test("Should return Left -> Exception when SignInWithEmail is called",
      () async {
    when(datasource.signInWithEmail(
            email: 'test@mail.com', password: '12345678'))
        .thenThrow(Exception(""));

    final result = await repository.signInWithEmail(
        email: 'test@mail.com', password: '12345678');

    expect(result, Left<Exception, UserEntity>(Exception("Erro Inesperado")));
  });
}
