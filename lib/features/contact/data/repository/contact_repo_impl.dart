import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/network/errors/error.dart';
import '../../../../../base/network/errors/extension.dart';
import '../datasource/models/contact_model.dart';
import '../datasource/services/contact_service.dart';
import 'contact_repo.dart';

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

      return right(res.data!);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
