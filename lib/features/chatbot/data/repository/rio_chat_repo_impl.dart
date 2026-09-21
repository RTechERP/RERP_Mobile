import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/network/errors/error.dart';
import '../datasource/models/rio_chat_model.dart';
import '../datasource/service/rio_chat_service.dart';
import 'rio_chat_repo.dart';

@LazySingleton(as: RioChatRepo)
class RioChatRepoImpl implements RioChatRepo {
  final RioChatService _service;

  RioChatRepoImpl(this._service);

  @override
  Future<Either<BaseError, RioChatResponse>> sendMessage({
    required String message,
  }) async {
    return _service.sendMessage(message: message);
  }
}
