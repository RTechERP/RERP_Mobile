import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

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

  FormFieldState<String>? projectField;
  FormFieldState<String>? startingPointField;
  FormFieldState<String>? returnPointField;
  FormFieldState<String>? typeTransportField;

  FormFieldState<String>? destinationAddressField;
  FormFieldState<String>? returnAddressField;

  FormFieldState<String>? provincesField;

  List<BookingVehicleProjectItem> get _projects => widget.projects;
  List<ProvinceDepartureItem> get _departureProvinces =>
      widget.departureProvinces;
  List<ProvinceArrivesItem> get _arrivalProvinces => widget.arrivalProvinces;

  final List<String> _types = const ['Ô tô, xe máy ...', 'Máy bay'];
  String _returnPointValue = _otherPointLabel;

  bool get _isReturnPointOther => _returnPointValue.trim() == _otherPointLabel;

  List<String> get _endingPointOptions {
    final points = _departureProvinces
        .map((e) => e.provinceName)
        .where((e) => e.trim().isNotEmpty)
        .toSet()
        .toList();
    points.add(_otherPointLabel);
    return points;
  }

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

  Future<void> _pickReturnPoint() async {
    await openSelectBottomSheet<String>(
      context: context,
      title: 'Chọn điểm đón',
      items: _endingPointOptions,
      displayText: (v) => v,
      onSelected: (item) {
        final selected = item.trim();
        setState(() {
          _returnPointValue = selected;
        });
        returnPointField?.didChange(selected);

        // Nếu không phải "Khác" thì disable field cụ thể và copy giá trị.
        if (selected != _otherPointLabel) {
          returnAddressField?.didChange(selected);
        }
      },
    );
  }

  Future<void> _pickTypeTransport() async {
    await openSelectBottomSheet<String>(
      context: context,
      title: 'Chọn loại phương tiện',
      items: _types,
      displayText: (v) => v,
      onSelected: (item) {
        typeTransportField?.didChange(item);
      },
    );
  }

  Future<void> _pickProvinces() async {
    await openSelectBottomSheet<ProvinceArrivesItem>(
      context: context,
      title: 'Chọn tỉnh cần về',
      items: _arrivalProvinces,
      displayText: (v) => v.provinceName ?? '',
      onSelected: (item) {
        provincesField?.didChange(item.provinceName ?? '');
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
                nameForm: 'project',
                nameTextField: 'project_text',
                label: 'Dự án',
                onFieldCreated: (field) => projectField = field,
                readOnly: true,
              ),
            ),
          ),
          const SizedBox(height: 8),

          FormDateTimePicker(
            icon: Icons.access_time,
            nameForm: 'time_need_present',
            nameTimePicker: 'time_need_present_picker',
            label: 'Thời gian cần về',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
          ),
          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.navigation_outlined,
            nameForm: 'location_address',
            nameTextField: 'location_address_text',
            label: 'Công ty cần về',
          ),
          const SizedBox(height: 8),

          GestureDetector(
            onTap: _pickProvinces,
            child: AbsorbPointer(
              child: FormInputField(
                icon: Icons.navigation_outlined,
                nameForm: 'provinces',
                nameTextField: 'provinces_text',
                label: 'Tỉnh cần về',
                onFieldCreated: (field) => provincesField = field,
                readOnly: true,
              ),
            ),
          ),
          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.location_on_outlined,
            nameForm: 'address',
            nameTextField: 'address_text',
            label: 'Địa chỉ cụ thể',
          ),
          const SizedBox(height: 8),

          FormDateTimePicker(
            icon: Icons.departure_board_outlined,
            nameForm: 'time_return',
            nameTimePicker: 'time_return_picker',
            label: 'Thời gian đón',
            inputType: InputType.both,
            format: DateFormat('dd/MM/yyyy - HH:mm'),
          ),
          const SizedBox(height: 8),

          GestureDetector(
            onTap: _pickReturnPoint,
            child: AbsorbPointer(
              child: FormInputField(
                icon: Icons.navigation_outlined,
                nameForm: 'return_point',
                nameTextField: 'return_point_text',
                label: 'Điểm đón',
                onFieldCreated: (field) => returnPointField = field,
                readOnly: true,
              ),
            ),
          ),

          const SizedBox(height: 8),

          FormInputField(
            icon: Icons.navigation_outlined,
            nameForm: 'return_address',
            nameTextField: 'return_address_text',
            label: 'Địa chỉ đón cụ thể',
            enabled: _isReturnPointOther,
            readOnly: !_isReturnPointOther,
            onFieldCreated: (field) => returnAddressField = field,
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
                readOnly: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
