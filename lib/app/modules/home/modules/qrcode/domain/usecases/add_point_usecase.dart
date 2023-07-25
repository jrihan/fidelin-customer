import 'package:customer/app/modules/home/modules/qrcode/domain/repositories/qrcode_repository.dart';
import 'package:dartz/dartz.dart';

abstract class AddPointUseCase {
  Future<Either<Exception, void>> call(String pointId);
}

class AddPointUseCaseImpl implements AddPointUseCase {
  final QrCodeRepository _repository;

  AddPointUseCaseImpl({required QrCodeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, void>> call(String pointId) {
    return _repository.addPoint(pointId);
  }
}
