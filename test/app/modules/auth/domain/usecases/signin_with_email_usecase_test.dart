import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:customer/app/modules/auth/domain/entities/user_entity.dart';
import 'package:customer/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:customer/app/modules/auth/domain/usecases/signin_with_email_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'signin_with_email_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
main() {
  final AuthRepository repository = MockAuthRepository();
  final SignInWithEmailUseCase usecase =
      SignInWithEmailUseCaseImpl(repository: repository);

  test("Should return a UserEntity when function called", () async {
    when(usecase.call(email: '', password: '')).thenAnswer(
      (_) async => right(
        const UserEntity(
            firstName: '', lastName: '', email: '', phone: 'phone', gender: ''),
      ),
    );
  });
}
