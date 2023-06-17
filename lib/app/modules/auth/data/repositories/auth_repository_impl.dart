import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/auth/data/datasources/auth_datasource.dart';
import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:customer/app/modules/auth/data/mapper/user_mapper.dart';
import 'package:customer/app/modules/auth/domain/entities/user_entity.dart';
import 'package:customer/app/modules/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl({required AuthDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Exception, UserEntity>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final result =
          await _dataSource.signInWithEmail(email: email, password: password);
      UserEntity user = UserMapper.mapDTOtoEntity(result);
      return right(user);
    } on Exception catch (e) {
      return left(Exception("Erro Inesperado"));
    }
  }

  @override
  Future<Either<Exception, Unit>> signUpWithEmail(UserDTO user) async {
    try {
      await _dataSource.signUpWithEmail(user);
      return right(unit);
    } on Exception catch (e) {
      return left(Exception("Erro Inesperado"));
    }
  }

  @override
  Future<Either<Exception, Unit>> forgotPassword(
      {required String email}) async {
    try {
      await _dataSource.requestForgotPassword(email: email);
      return right(unit);
    } on Exception catch (e) {
      return left(Exception("Erro Inesperado"));
    }
  }
}
