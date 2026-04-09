import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../../common/widgets/form/index.dart';

import '../../../data/datasource/models/booking_vehicle_model.dart';

/// Form chung: Đăng ký lấy hàng thương mại + Đăng ký lấy hàng Demo/triển lãm.
class TypeFormReceiver extends StatefulWidget {
  const TypeFormReceiver({
    super.key,
    required this.projects,
    required this.arrivalProvinces,
  });

  final List<BookingVehicleProjectItem> projects;
  final List<ProvinceArrivesItem> arrivalProvinces;

  @override
  State<TypeFormReceiver> createState() => _TypeFormReceiverState();
}

class _TypeFormReceiverState extends State<TypeFormReceiver> {
  FormFieldState<String>? projectField;
  FormFieldState<String>? provinceField;
  FormFieldState<String>? typeTransportField;

  List<BookingVehicleProjectItem> get _projects => widget.projects;
  List<ProvinceArrivesItem> get _arrivalProvinces => widget.arrivalProvinces;

  static const List<String> _vehicleTypes = [
    'Ô tô, xe máy ...',
    'Máy bay',
  ];

  Future<void> _pickProject() async {
    await openSelectBottomSheet<BookingVehicleProjectItem>(
      context: context,
      title: 'Chọn dự án',
      items: _projects,
      displayText: (v) => '${v.projectCode ?? ''} - ${v.projectName ?? ''}',
      onSelected: (item) {
        projectField?.didChange(
          '${item.projectCode ?? ''} - ${item.projectName ?? ''}'.trim(),
        );
      },
    );
  }

  Future<void> _pickProvince() async {
    await openSelectBottomSheet<ProvinceArrivesItem>(
      context: context,
      title: 'Chọn tỉnh đến lấy',
      items: _arrivalProvinces,
      displayText: (v) => v.provinceName ?? '',
      onSelected: (item) {
        provinceField?.didChange(item.provinceName ?? '');
      },
    );
  }

  Future<void> _pickTypeTransport() async {
    await openSelectBottomSheet<String>(
      context: context,
      title: 'Chọn loại phương tiện',
      items: _vehicleTypes,
      displayText: (v) => v,
      onSelected: (item) {
        typeTransportField?.didChange(item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        children: [
          GestureDetector(
            onTap: _pickProject,
            child: AbsorbPointer(
              child: FormInputField(
                icon: Icons.navigation_outlined,
                nameForm: 'pickup_project',
                nameTextField: 'pickup_project_text',
                label: 'Dự án',
                onFieldCreated: (field) => projectField = field,
                isRequired: true,
                validator: FormBuilderValidators.required(
                  errorText: 'Vui lòng chọn dự án',
                ),
                readOnly: true,
              ),
            ),
          ),
          const SizedBox(height: 8),

          FormDateTimePicker(
            icon: Icons.access_time,
            nameForm: 'pickup_need_arrive_time',
            nameTimePicker: 'pickup_need_arrive_time_picker',
            label: 'Thời gian cần đến lấy',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn thời gian cần đến lấy',
            ),
          ),
          const SizedBox(height: 8),
          FormDateTimePicker(
            icon: Icons.departure_board_outlined,
            nameForm: 'pickup_departure_time',
            nameTimePicker: 'pickup_departure_time_picker',
            label: 'Thời gian xuất phát',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn thời gian xuất phát',
            ),
          ),
          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.apartment_outlined,
            nameForm: 'pickup_company',
            nameTextField: 'pickup_company_text',
            label: 'Công ty đến lấy',
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập công ty đến lấy',
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _pickProvince,
            child: AbsorbPointer(
              child: FormInputField(
                icon: Icons.map_outlined,
                nameForm: 'pickup_province',
                nameTextField: 'pickup_province_text',
                label: 'Tỉnh đến lấy',
                onFieldCreated: (field) => provinceField = field,
                isRequired: true,
                validator: FormBuilderValidators.required(
                  errorText: 'Vui lòng chọn tỉnh đến lấy',
                ),
                readOnly: true,
              ),
            ),
          ),
          const SizedBox(height: 8),
          FormInputField(
            icon: Icons.location_on_outlined,
            nameForm: 'pickup_address',
            nameTextField: 'pickup_address_text',
            label: 'Địa chỉ cụ thể đến lấy',
            maxLines: 3,
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập địa chỉ cụ thể đến lấy',
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _pickTypeTransport,
            child: AbsorbPointer(
              child: FormInputField(
                icon: Icons.directions_car_outlined,
                nameForm: 'type_transport',
                nameTextField: 'type_transport_text',
                label: 'Loại phương tiện',
                onFieldCreated: (field) => typeTransportField = field,
                isRequired: true,
                validator: FormBuilderValidators.required(
                  errorText: 'Vui lòng chọn loại phương tiện',
                ),
                readOnly: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
