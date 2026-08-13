import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../../../../../../../base/network/errors/error.dart';

abstract class SignatureRepo {
  Future<Either<BaseError, Uint8List?>> getEmployeeSignature();
}
