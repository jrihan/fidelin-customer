import 'package:dartz/dartz.dart';

abstract class QrCodeRepository {
  Future<Either<Exception, void>> addPoint(String pointId);
}
