import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';

abstract class SignatureRepo {
  Future<Either<BaseError, Uint8List?>> getEmployeeSignature();

  Future<Either<BaseError, void>> uploadSignature(Uint8List signatureBytes);

  Future<Either<BaseError, void>> deleteEmployeeSignature();
}
