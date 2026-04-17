import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../common/app_theme/index.dart';
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
  List<BookingVehicleProjectItem> get _projects => widget.projects;
  List<ProvinceArrivesItem> get _arrivalProvinces => widget.arrivalProvinces;

  static const List<FormChoiceOption<String>> _vehicleTypes = [
    FormChoiceOption(value: 'Ô tô, xe máy ...', label: 'Ô tô, xe máy ...', selectedColor: AppColors.primaryERP),
    FormChoiceOption(value: 'Máy bay', label: 'Máy bay', selectedColor: AppColors.primaryERP),
  ];

  Future<void> _pickProject() async {
    final form = FormBuilder.of(context);
    final currentProject = form?.fields['pickup_project']?.value as String? ?? '';
    final currentProjectItem = _projects.cast<BookingVehicleProjectItem?>().firstWhere(
      (p) => '${p!.projectCode ?? ''} - ${p.projectName ?? ''}'.trim() == currentProject,
      orElse: () => null,
    );
    await openSelectBottomSheet<BookingVehicleProjectItem>(
      context: context,
      title: 'Chọn dự án',
      items: _projects,
      displayText: (v) => '${v.projectCode ?? ''} - ${v.projectName ?? ''}',
      onSelected: (item) {
        form?.fields['pickup_project']?.didChange(
          '${item.projectCode ?? ''} - ${item.projectName ?? ''}'.trim(),
        );
      },
      initialSelectedItem: currentProjectItem,
    );
  }

  Future<void> _pickProvince() async {
    final form = FormBuilder.of(context);
    final currentProvince = form?.fields['pickup_province']?.value as String? ?? '';
    final currentItem = _arrivalProvinces.cast<ProvinceArrivesItem?>().firstWhere(
      (p) => p!.provinceName == currentProvince,
      orElse: () => null,
    );
    await openSelectBottomSheet<ProvinceArrivesItem>(
      context: context,
      title: 'Chọn tỉnh đến lấy',
      items: _arrivalProvinces,
      displayText: (v) => v.provinceName ?? '',
      onSelected: (item) {
        form?.fields['pickup_province']?.didChange(item.provinceName ?? '');
      },
      initialSelectedItem: currentItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'pickup_project',
            readOnly: true,
            decoration: formInputDecoration(
              context,
              label: 'Dự án',
              icon: Icons.navigation_outlined,
              isRequired: true,
            ),
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn dự án',
            ),
            onTap: _pickProject,
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

          FormBuilderTextField(
            name: 'pickup_province',
            readOnly: true,
            decoration: formInputDecoration(
              context,
              label: 'Tỉnh đến lấy',
              icon: Icons.map_outlined,
              isRequired: true,
            ),
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn tỉnh đến lấy',
            ),
            onTap: _pickProvince,
          ),
          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.location_on_outlined,
            nameForm: 'pickup_address',
            nameTextField: 'pickup_address_text',
            label: 'Địa chỉ cụ thể đến lấy',
            autoExpand: true,
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập địa chỉ cụ thể đến lấy',
            ),
          ),
          const SizedBox(height: 8),

          FormChoiceGroup<String>(
            name: 'type_transport',
            label: 'Loại phương tiện',
            icon: Icons.directions_car_outlined,
            options: _vehicleTypes,
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn loại phương tiện',
            ),
          ),
        ],
      ),
    );
  }
}
