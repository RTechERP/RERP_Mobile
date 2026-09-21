import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/errors/error.dart';
import '../datasource/models/business_card_model.dart';
import '../datasource/services/business_card_service.dart';
import '../datasource/services/business_card_vision_helpers.dart';
import '../datasource/services/ollama_host_resolver.dart';
import 'business_card_repo.dart';

@LazySingleton(as: BusinessCardRepo)
class BusinessCardRepoImpl implements BusinessCardRepo {
  BusinessCardRepoImpl(this._service, this._hostResolver);

  final BusinessCardService _service;
  final OllamaHostResolver _hostResolver;

  @override
  Future<Either<BaseError, List<BusinessCardModel>>> getBusinessCards({
    int departmentID = 0,
    String? keyword,
    int? isFavorite,
  }) {
    return _service.getBusinessCards(
      departmentID: departmentID,
      keyword: keyword,
      isFavorite: isFavorite,
    );
  }

  @override
  Future<Either<BaseError, Map<String, String>>> scanBusinessCard(
    String imagePath,
  ) async {
    // 1. Resolve Ollama host (auto-discovery LAN/loopback).
    final baseUrl = await _hostResolver.resolve();
    if (baseUrl == null) {
      return left(
        const BaseError.httpUnknownError(
          'Không tìm thấy Ollama đang chạy. '
          '�ảảm bảo Ollama đã khởi động và listen trên 0.0.0.0:11434.',
        ),
      );
    }

    // 2. Gọi service thống nhất — encode + call Ollama + parse.
    final result = await _service.scanBusinessCardImage(
      imagePath: imagePath,
      ollamaUrl: baseUrl,
    );

    return result.fold(
      left,
      (vision) => right(businessCardVisionResultToMap(vision)),
    );
  }

  @override
  Future<bool> isOllamaAvailable() async {
    final baseUrl = await _hostResolver.resolve();
    if (baseUrl == null) return false;
    return _hostResolver.isAvailable(baseUrl);
  }
}
