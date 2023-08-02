import 'package:customer/app/modules/home/modules/qrcode/domain/usecases/add_point_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart';

part 'qrcode_controller.g.dart';

class QrCodeController = _QrCodeControllerBase with _$QrCodeController;

abstract class _QrCodeControllerBase with Store {
  late AddPointUseCase _addPointUseCase;

  _QrCodeControllerBase({required AddPointUseCase addPointUseCase}) {
    _addPointUseCase = addPointUseCase;
  }

  @action
  Future<void> addPoint(String pointId) async {
    final Either<Exception, void> _response = await _addPointUseCase(pointId);
    _response.fold((Exception e) {
      AsukaSnackbar.warning("Error").show();
    }, (void a) => Null);
  }
}
