import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/errors/error.dart';
import '../../../../../base/network/errors/extension.dart';
import '../datasource/models/contact_model.dart';
import '../datasource/services/contact_service.dart';
import 'contact_repo.dart';
import 'contact_repository.dart';

@LazySingleton(as: ContactRepo)
class ContactRepoImpl implements ContactRepo {
  final ContactService _service;

  ContactRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<ContactPersonalItem>>> getContact({
    required int departmentID,
    String? keyword,
  }) async {
    try {
      final res = await _service.getContact(
        departmentID: departmentID,
        keyword: keyword,
      );

      if (res.data == null || res.data!.isEmpty) {
        return right([]);
      }

      // Cache contacts for department 0 (all contacts)
      if (departmentID == 0 && (keyword == null || keyword.isEmpty)) {
        await ContactRepository.saveContactCache(res.data!);
      }

      return right(res.data!);
    } on DioException catch (e) {
      // Try to return cached data on network error
      if (departmentID == 0) {
        final cached = await ContactRepository.getContactCache();
        if (cached != null && cached.isNotEmpty) {
          return right(cached);
        }
      }
      return left(e.baseError);
    }
  }
}
