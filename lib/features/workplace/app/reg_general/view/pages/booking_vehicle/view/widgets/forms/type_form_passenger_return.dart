import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../../common/widgets/form/index.dart';

import '../../../data/datasource/models/booking_vehicle_model.dart';

class TypeFormPassengerReturn extends StatefulWidget {
  const TypeFormPassengerReturn({
    super.key,
    required this.projects,
    required this.departureProvinces,
    required this.arrivalProvinces,
  });

  final List<BookingVehicleProjectItem> projects;
  final List<ProvinceDepartureItem> departureProvinces;
  final List<ProvinceArrivesItem> arrivalProvinces;

  @override
  State<TypeFormPassengerReturn> createState() =>
      _TypeFormPassengerReturnState();
}

class _TypeFormPassengerReturnState extends State<TypeFormPassengerReturn> {
  static const String _otherPointLabel = 'Khác';

  String _returnPointValue = 'Khác';

  String get _returnPointDisplay => _returnPointValue;

  bool get _isReturnPointOther =>
      _returnPointValue.trim() == _otherPointLabel;

  List<BookingVehicleProjectItem> get _projects => widget.projects;
  List<ProvinceDepartureItem> get _departureProvinces =>
      widget.departureProvinces;
  List<ProvinceArrivesItem> get _arrivalProvinces => widget.arrivalProvinces;

  List<String> get _pickupPointOptions {
    final points = _departureProvinces
        .map((e) => e.provinceName)
        .where((e) => e.trim().isNotEmpty)
        .toSet()
        .toList();
    return [_otherPointLabel, ...points];
  }

  static const List<FormChoiceOption<String>> _vehicleTypes = [
    FormChoiceOption(value: 'Ô tô, xe máy ...', label: 'Ô tô, xe máy ...', selectedColor: AppColors.primaryERP),
    FormChoiceOption(value: 'Máy bay', label: 'Máy bay', selectedColor: AppColors.primaryERP),
  ];

  Future<void> _pickProject() async {
    final form = FormBuilder.of(context);
    final currentProject = form?.fields['project']?.value as String? ?? '';
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
        form?.fields['project']?.didChange(
          '${item.projectCode ?? ''} - ${item.projectName ?? ''}'.trim(),
        );
      },
      initialSelectedItem: currentProjectItem,
    );
  }

  Future<void> _pickProvinces() async {
    final form = FormBuilder.of(context);
    final currentProvince = form?.fields['provinces']?.value as String? ?? '';
    final currentItem = _arrivalProvinces.cast<ProvinceArrivesItem?>().firstWhere(
      (p) => p!.provinceName == currentProvince,
      orElse: () => null,
    );
    await openSelectBottomSheet<ProvinceArrivesItem>(
      context: context,
      title: 'Chọn tỉnh cần về',
      items: _arrivalProvinces,
      displayText: (v) => v.provinceName ?? '',
      onSelected: (item) {
        form?.fields['provinces']?.didChange(item.provinceName ?? '');
      },
      initialSelectedItem: currentItem,
    );
  }

  Future<void> _pickReturnPoint() async {
    final form = FormBuilder.of(context);
    final currentReturn = form?.fields['return_point']?.value as String? ?? '';
    await openSelectBottomSheet<String>(
      context: context,
      title: 'Chọn điểm đón',
      items: _pickupPointOptions,
      displayText: (v) => v,
      onSelected: (item) {
        final selected = item.trim();
        setState(() => _returnPointValue = selected);
        form?.fields['return_point']?.didChange(selected);
        if (selected == _otherPointLabel) {
          form?.fields['return_address']?.didChange('');
        } else {
          form?.fields['return_address']?.didChange(selected);
        }
      },
      initialSelectedItem: currentReturn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startOfToday = DateTime(now.year, now.month, now.day);

    return FormCard(
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'project',
            readOnly: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
            nameForm: 'time_need_present',
            nameTimePicker: 'time_need_present_picker',
            label: 'Thời gian cần về',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn thời gian cần về',
            ),
          ),
          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.navigation_outlined,
            nameForm: 'location_address',
            nameTextField: 'location_address_text',
            label: 'Công ty cần về',
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập công ty cần về',
            ),
          ),
          const SizedBox(height: 8),

          FormBuilderTextField(
            name: 'provinces',
            readOnly: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: formInputDecoration(
              context,
              label: 'Tỉnh cần về',
              icon: Icons.navigation_outlined,
              isRequired: true,
            ),
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn tỉnh cần về',
            ),
            onTap: _pickProvinces,
          ),
          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.location_on_outlined,
            nameForm: 'address',
            nameTextField: 'address_text',
            label: 'Địa chỉ cụ thể',
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập địa chỉ cụ thể',
            ),
          ),
          const SizedBox(height: 8),

          FormDateTimePicker(
            icon: Icons.departure_board_outlined,
            nameForm: 'time_return',
            nameTimePicker: 'time_return_picker',
            label: 'Thời gian đón',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn thời gian đón',
            ),
            firstDate: startOfToday,
          ),
          const SizedBox(height: 8),

          FormBuilderTextField(
            name: 'return_point',
            initialValue: _returnPointDisplay,
            readOnly: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: formInputDecoration(
              context,
              label: 'Điểm đón',
              icon: Icons.navigation_outlined,
              isRequired: true,
            ),
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn điểm đón',
            ),
            onTap: _pickReturnPoint,
          ),

          const SizedBox(height: 8),

          FormBuilderTextField(
            name: 'return_address',
            initialValue: 'VP Hà Nội',
            enabled: _isReturnPointOther,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: formInputDecoration(
              context,
              label: 'Địa chỉ đón cụ thể',
              icon: Icons.navigation_outlined,
              isRequired: _isReturnPointOther,
            ),
            validator: (v) {
              if (!(_isReturnPointOther)) return null;
              final val = v?.trim() ?? '';
              if (val.isEmpty) {
                return 'Vui lòng nhập địa chỉ đón cụ thể';
              }
              return null;
            },
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
