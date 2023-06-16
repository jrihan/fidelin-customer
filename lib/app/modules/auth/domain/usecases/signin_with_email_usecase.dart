import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/auth/domain/entities/user_entity.dart';
import 'package:customer/app/modules/auth/domain/repositories/auth_repository.dart';

abstract class SignInWithEmailUseCase {
  Future<Either<Exception, UserEntity>> call(
      {required String email, required String password});
}

class SignInWithEmailUseCaseImpl implements SignInWithEmailUseCase {
  final AuthRepository _repository;

  SignInWithEmailUseCaseImpl({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, UserEntity>> call(
      {required String email, required String password}) {
    return _repository.signInWithEmail(email: email, password: password);
  }
}
