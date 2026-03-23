import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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

  List<BookingVehicleProjectItem> get _projects => widget.projects;
  List<ProvinceArrivesItem> get _arrivalProvinces => widget.arrivalProvinces;

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
          ),
          const SizedBox(height: 8),
          FormDateTimePicker(
            icon: Icons.departure_board_outlined,
            nameForm: 'pickup_departure_time',
            nameTimePicker: 'pickup_departure_time_picker',
            label: 'Thời gian xuất phát',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
          ),
          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.apartment_outlined,
            nameForm: 'pickup_company',
            nameTextField: 'pickup_company_text',
            label: 'Công ty đến lấy',
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
          ),
        ],
      ),
    );
  }
}
