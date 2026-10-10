import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../datasource/models/rio_chat_model.dart';

abstract class RioChatRepo {
  Future<Either<BaseError, RioChatResponse>> sendMessage({
    required String message,
  });
}
