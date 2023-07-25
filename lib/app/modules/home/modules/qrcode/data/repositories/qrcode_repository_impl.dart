import 'package:customer/app/modules/home/modules/qrcode/data/datasources/qrcode_datasource.dart';
import 'package:customer/app/modules/home/modules/qrcode/domain/repositories/qrcode_repository.dart';
import 'package:dartz/dartz.dart';

class QrCodeRepositoryImpl implements QrCodeRepository {
  QrCodeDataSource _dataSource;

  QrCodeRepositoryImpl({required QrCodeDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Exception, Unit>> addPoint(String pointId) async {
    try {
      //final result = await _dataSource.addPoint(pointId);

      return right(unit);
    } on Exception catch (e) {
      return left(Exception("Erro Inesperado"));
    }
  }
}
