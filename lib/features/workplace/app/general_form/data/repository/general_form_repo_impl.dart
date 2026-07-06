import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/errors/error.dart';
import 'package:rtc_erp/features/workplace/app/general_form/data/datasource/model/general_form_model.dart';
import 'package:rtc_erp/features/workplace/app/reports/data/datasource/models/report_model.dart';

import '../../../../../../../../../base/network/errors/extension.dart';
import '../datasource/service/general_form_service.dart';
import 'general_form_repo.dart';

@LazySingleton(as: GeneralFormRepo)
class GeneralFormRepoImpl implements GeneralFormRepo {
  final GeneralFormService _service;
  GeneralFormRepoImpl(this._service);

  @override
  Future<Either<BaseError, List<FormItem>>> getGeneralForm({
    required int departmentId,
  }) async {
    try{
      final res = await _service.getGeneralForm(departmentId: departmentId);
      if(res.status == 1 && res.data != null){
        return right(res.data!);
      }
      return left(
        BaseError.httpInternalServerError(res.message ?? 'Có lỗi xảy ra'),
      );
    } on DioException catch (e){
      return left(e.baseError);
    }
  }

  @override
  Future<Either<BaseError, List<DepartResponse>>> getDepart() async {
    try {
      final res = await _service.getDepart();
      return right(res.data ?? []);
    } on DioException catch (e) {
      return left(e.baseError);
    }
  }
}
