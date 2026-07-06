import 'package:injectable/injectable.dart';
import 'package:rtc_erp/base/network/dio/dio_base_api_service.dart';

import '../../../../../../../../../../base/network/models/base_data.dart';
import '../../../../../../../../../../common/constants.dart';
import '../../../../reports/data/datasource/models/report_model.dart';
import '../model/general_form_model.dart';

@injectable
class GeneralFormService extends DioBaseApiService{
  GeneralFormService(super.dio);
  Future<BaseData<List<FormItem>>> getGeneralForm({
    required int departmentId,
  }) async {
    return get<BaseData<List<FormItem>>>(
      ApiEndPoint.getGeneralForm,
      query: {'departID': departmentId},
      parser: (json) =>
      BaseData<List<FormItem>>.fromJson(
        json,
            (data) =>
            ((data as List?) ?? const <dynamic>[])
                .map((e) => FormItem.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
    );
  }

  Future<BaseData<List<DepartResponse>>> getDepart() {
    return get<BaseData<List<DepartResponse>>>(
      ApiEndPoint.departForm,
      parser: (json) => BaseData<List<DepartResponse>>.fromJson(
        json,
            (data) => (data as List)
            .map((e) => DepartResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}
