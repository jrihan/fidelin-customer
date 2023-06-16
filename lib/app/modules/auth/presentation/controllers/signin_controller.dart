import 'package:customer/app/stores/user_store.dart';
import 'package:dartz/dartz.dart';
import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:customer/app/modules/auth/domain/entities/user_entity.dart';
import 'package:customer/app/modules/auth/domain/usecases/signin_with_email_usecase.dart';
import 'package:customer/app/modules/auth/domain/usecases/signup_with_email_usercase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'signin_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase with Store {
  late SignInWithEmailUseCase _signInWithEmailUseCase;
  late SignUpWithEmailUseCase _signUpWithEmailUseCase;

  final UserStore _userStore = Modular.get<UserStore>();

  _SignInControllerBase(
      {required SignInWithEmailUseCase signInWithEmailUseCase,
      required SignUpWithEmailUseCase signUpWithEmailUseCase}) {
    _signInWithEmailUseCase = signInWithEmailUseCase;
    _signUpWithEmailUseCase = signUpWithEmailUseCase;
  }

  @action
  Future<void> signIn() async {
    final Either<Exception, UserEntity> _response =
        await _signInWithEmailUseCase.call(
            email: 'test@gmail.com', password: '12345678');
    _response.fold((Exception e) {}, (UserEntity user) {
      _userStore.setUser(user);
      Modular.to.navigate('/home/');
    });
  }

  @action
  Future<void> signUp() async {
    const UserDTO user = UserDTO(
        firstName: 'Emanuel',
        lastName: 'Padilha',
        email: 'manuelpadrilha22@gmail.com',
        phone: '+5581999999999',
        gender: 'male',
        password: 'password123');

    final Either<Exception, Unit> _response =
        await _signUpWithEmailUseCase.call(user);
    _response.fold((Exception e) {}, (_) {});
  }
}
