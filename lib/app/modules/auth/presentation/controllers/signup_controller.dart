import 'package:customer/app/modules/auth/data/dto/user_dto.dart';
import 'package:customer/app/modules/auth/domain/usecases/signup_with_email_usercase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  late SignUpWithEmailUseCase _signUpWithEmailUseCase;

  _SignUpControllerBase(
      {required SignUpWithEmailUseCase signUpWithEmailUseCase}) {
    _signUpWithEmailUseCase = signUpWithEmailUseCase;
  }

  final formField = GlobalKey<FormState>();

  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  @action
  Future<void> signUp() async {
    if (formField.currentState!.validate()) {
      const UserDTO user = UserDTO(
          name: 'Emanuel Padilha',
          email: 'manuelpadrilha22@gmail.com',
          phone: '+5581999999999',
          gender: 'male',
          password: 'password123');

      final Either<Exception, Unit> _response =
          await _signUpWithEmailUseCase.call(user);
      _response.fold((Exception e) {}, (_) {});
    }
  }

  String? passwordEquals(String? value) {
    if (passwordTextController.text != confirmPasswordTextController.text) {
      return 'As senhas devem ser iguais';
    }

    if (value!.isEmpty) {
      return 'Insira uma senha';
    }
    bool passwordValid = RegExp(r"(?=.{8,})").hasMatch(value);
    if (!passwordValid) {
      return "Insira uma senha válida (deve conter 8 caracteres)";
    }
    return null;
  }
}
