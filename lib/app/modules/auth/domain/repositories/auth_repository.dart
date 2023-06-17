import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/auth/data/dto/user_dto.dart';

import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Exception, UserEntity>> signInWithEmail(
      {required String email, required String password});

  Future<Either<Exception, Unit>> signUpWithEmail(UserDTO user);

  Future<Either<Exception, Unit>> forgotPassword({required String email});
}
