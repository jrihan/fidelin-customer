import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/auth/domain/repositories/auth_repository.dart';

abstract class ForgotPasswordUseCase {
  Future<Either<Exception, Unit>> call({required String email});
}

class ForgotPasswordUseCaseImpl implements ForgotPasswordUseCase {
  final AuthRepository _repository;

  ForgotPasswordUseCaseImpl({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, Unit>> call({required String email}) {
    return _repository.forgotPassword(email: email);
  }
}
