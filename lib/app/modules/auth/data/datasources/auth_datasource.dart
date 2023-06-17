import 'package:customer/app/modules/auth/data/dto/user_dto.dart';

abstract class AuthDataSource {
  Future<UserDTO> signInWithEmail(
      {required String email, required String password});

  Future<void> signUpWithEmail(UserDTO user);

  Future<void> signOut();

  Future<void> requestForgotPassword({required String email});
}
