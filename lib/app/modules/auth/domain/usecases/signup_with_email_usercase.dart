import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:customer/app/modules/auth/domain/repositories/auth_repository.dart';

abstract class SignUpWithEmailUseCase {
  Future<Either<Exception, Unit>> call(UserDTO user);
}

class SignUpWithEmailUseCaseImpl implements SignUpWithEmailUseCase {
  final AuthRepository _repository;

  SignUpWithEmailUseCaseImpl({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, Unit>> call(UserDTO user) {
    return _repository.signUpWithEmail(user);
  }
}
