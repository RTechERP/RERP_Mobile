import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../../common/widgets/form/index.dart';

import '../../../data/datasource/models/booking_vehicle_model.dart';

class TypeFormPassengerGo extends StatefulWidget {
  const TypeFormPassengerGo({
    super.key,
    required this.projects,
    required this.departureProvinces,
    required this.arrivalProvinces,
  });

  final List<BookingVehicleProjectItem> projects;
  final List<ProvinceDepartureItem> departureProvinces;
  final List<ProvinceArrivesItem> arrivalProvinces;

  @override
  State<TypeFormPassengerGo> createState() => _TypeFormPassengerGoState();
}

class _TypeFormPassengerGoState extends State<TypeFormPassengerGo> {
  static const String _otherPointLabel = 'Khác';

  String _startingPointValue = 'VP Hà Nội';
  String _returnPointValue = 'Khác';

  bool get _isStartingPointOther =>
      _startingPointValue.trim() == _otherPointLabel;
  bool get _isReturnPointOther =>
      _returnPointValue.trim() == _otherPointLabel;

  List<BookingVehicleProjectItem> get _projects => widget.projects;
  List<ProvinceDepartureItem> get _departureProvinces =>
      widget.departureProvinces;
  List<ProvinceArrivesItem> get _arrivalProvinces => widget.arrivalProvinces;

  List<String> get _departurePointOptions {
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
      title: 'Chọn tỉnh cần đến',
      items: _arrivalProvinces,
      displayText: (v) => v.provinceName ?? '',
      onSelected: (item) {
        form?.fields['provinces']?.didChange(item.provinceName ?? '');
      },
      initialSelectedItem: currentItem,
    );
  }

  Future<void> _pickStartingPoint() async {
    final form = FormBuilder.of(context);
    final currentStarting = form?.fields['starting_point']?.value as String? ?? '';
    await openSelectBottomSheet<String>(
      context: context,
      title: 'Chọn điểm xuất phát',
      items: _departurePointOptions,
      displayText: (v) => v,
      onSelected: (item) {
        final selected = item.trim();
        setState(() => _startingPointValue = selected);
        form?.fields['starting_point']?.didChange(selected);
        if (selected == _otherPointLabel) {
          form?.fields['destination_address']?.didChange('');
        } else {
          form?.fields['destination_address']?.didChange(selected);
        }
      },
      initialSelectedItem: currentStarting,
    );
  }

  Future<void> _pickReturnPoint() async {
    final form = FormBuilder.of(context);
    final currentReturn = form?.fields['return_point']?.value as String? ?? '';
    await openSelectBottomSheet<String>(
      context: context,
      title: 'Chọn điểm về',
      items: _departurePointOptions,
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
            label: 'Thời gian cần đến',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
            isRequired: true,
            initialValue: DateTime.now()
                .add(const Duration(days: 1))
                .copyWith(hour: 9, minute: 0, second: 0, millisecond: 0, microsecond: 0),
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn thời gian cần đến',
            ),
          ),
          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.navigation_outlined,
            nameForm: 'location_address',
            nameTextField: 'location_address_text',
            label: 'Công ty cần đến',
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng nhập công ty cần đến',
            ),
          ),
          const SizedBox(height: 8),

          FormBuilderTextField(
            name: 'provinces',
            readOnly: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: formInputDecoration(
              context,
              label: 'Tỉnh cần đến',
              icon: Icons.navigation_outlined,
              isRequired: true,
            ),
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn tỉnh cần đến',
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
            nameForm: 'time_depart',
            nameTimePicker: 'time_depart_picker',
            label: 'Thời gian xuất phát',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
            isRequired: true,
            validator: FormBuilderValidators.required(
              errorText: 'Vui lòng chọn thời gian xuất phát',
            ),
            firstDate: startOfToday,
          ),
          const SizedBox(height: 8),

          FormDateTimePicker(
            icon: Icons.departure_board_outlined,
            nameForm: 'time_return',
            nameTimePicker: 'time_return_picker',
            label: 'Thời gian cần về (nếu có)',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: FormBuilderTextField(
                  name: 'starting_point',
                  readOnly: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: formInputDecoration(
                    context,
                    label: 'Xuất phát',
                    icon: Icons.location_on_outlined,
                    isRequired: true,
                  ),
                  validator: FormBuilderValidators.required(
                    errorText: 'Vui lòng chọn điểm xuất phát',
                  ),
                  onTap: _pickStartingPoint,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FormBuilderTextField(
                  name: 'return_point',
                  readOnly: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: formInputDecoration(
                    context,
                    label: 'Điểm về',
                    icon: Icons.navigation_outlined,
                    isRequired: true,
                  ),
                  validator: FormBuilderValidators.required(
                    errorText: 'Vui lòng chọn điểm về',
                  ),
                  onTap: _pickReturnPoint,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          FormBuilderTextField(
            name: 'destination_address',
            initialValue: 'VP Hà Nội',
            enabled: _isStartingPointOther,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: formInputDecoration(
              context,
              label: 'Điểm xuất phát cụ thể',
              icon: Icons.location_on_outlined,
              isRequired: _isStartingPointOther,
            ),
            validator: (v) {
              if (!(_isStartingPointOther)) return null;
              final val = v?.trim() ?? '';
              if (val.isEmpty) {
                return 'Vui lòng nhập địa chỉ xuất phát cụ thể';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          FormBuilderTextField(
            name: 'return_address',
            initialValue: 'VP Hà Nội',
            enabled: _isReturnPointOther,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: formInputDecoration(
              context,
              label: 'Địa chỉ quay về cụ thể',
              icon: Icons.navigation_outlined,
              isRequired: _isReturnPointOther,
            ),
            validator: (v) {
              if (!(_isReturnPointOther)) return null;
              final val = v?.trim() ?? '';
              if (val.isEmpty) {
                return 'Vui lòng nhập địa chỉ quay về cụ thể';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),

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
