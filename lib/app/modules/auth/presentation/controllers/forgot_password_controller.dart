import 'package:customer/app/modules/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'forgot_password_controller.g.dart';

class ForgotPasswordController = _ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class _ForgotPasswordControllerBase with Store {
  late ForgotPasswordUseCase _forgotPasswordUseCase;

  _ForgotPasswordControllerBase(
      {required ForgotPasswordUseCase forgotPasswordUseCase}) {
    _forgotPasswordUseCase = forgotPasswordUseCase;
  }

  @observable
  bool loading = false;

  @action
  Future<bool> requestForgotPassword({required String email}) async {
    loading = true;
    final Either<Exception, Unit> _response =
        await _forgotPasswordUseCase.call(email: email);
    _response.fold((Exception e) {
      loading = false;
      return false;
    }, (Unit user) {
      loading = false;
      return true;
    });
    return false;
  }
}
