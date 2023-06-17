// Mocks generated by Mockito 5.4.2 from annotations
// in customer/test/app/modules/auth/domain/usecases/signin_with_email_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:customer/app/modules/auth/data/dto/user_dto.dart' as _i6;
import 'package:customer/app/modules/auth/domain/entities/user_entity.dart'
    as _i5;
import 'package:customer/app/modules/auth/domain/repositories/auth_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i3.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<Exception, _i5.UserEntity>> signInWithEmail({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithEmail,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i4.Future<_i2.Either<Exception, _i5.UserEntity>>.value(
            _FakeEither_0<Exception, _i5.UserEntity>(
          this,
          Invocation.method(
            #signInWithEmail,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, _i5.UserEntity>>);
  @override
  _i4.Future<_i2.Either<Exception, _i2.Unit>> signUpWithEmail(
          _i6.UserDTO? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUpWithEmail,
          [user],
        ),
        returnValue: _i4.Future<_i2.Either<Exception, _i2.Unit>>.value(
            _FakeEither_0<Exception, _i2.Unit>(
          this,
          Invocation.method(
            #signUpWithEmail,
            [user],
          ),
        )),
      ) as _i4.Future<_i2.Either<Exception, _i2.Unit>>);
}
