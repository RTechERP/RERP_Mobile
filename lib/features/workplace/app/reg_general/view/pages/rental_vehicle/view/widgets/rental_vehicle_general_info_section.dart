// Section "Thông tin chung" của form thêm yêu cầu thuê xe:
// STT + Ngày yêu cầu + Loại xe + Người yêu cầu + Phòng ban.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/rental_vehicle_model.dart';
import 'rental_vehicle_label_helpers.dart';
import 'rental_vehicle_select_field.dart';

/// Section thông tin chung. Nhận controllers + selected items từ parent
/// (parent là `RentalVehicleAddScreen` để giữ form key + patch chung).
class RentalVehicleGeneralInfoSection extends StatelessWidget {
  const RentalVehicleGeneralInfoSection({
    super.key,
    required this.sttController,
    required this.vehicleTypes,
    required this.selectedVehicleType,
    required this.onVehicleTypeChanged,
    required this.employees,
    required this.selectedEmployee,
    required this.onEmployeeChanged,
  });

  final TextEditingController sttController;
  final List<RentalVehicleVehicleType> vehicleTypes;
  final RentalVehicleVehicleType? selectedVehicleType;
  final ValueChanged<RentalVehicleVehicleType> onVehicleTypeChanged;

  final List<RentalVehicleEmployee> employees;
  final RentalVehicleEmployee? selectedEmployee;
  final ValueChanged<RentalVehicleEmployee> onEmployeeChanged;

  static final _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        children: [
          // STT + Ngày yêu cầu (1 row)
          Row(
            children: [
              Expanded(
                flex: 4,
                child: FormInputField(
                  nameForm: 'stt',
                  nameTextField: 'stt_text',
                  label: 'STT',
                  icon: Icons.tag,
                  controller: sttController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 6,
                child: FormDateTimePicker(
                  nameForm: 'dateRequest',
                  nameTimePicker: 'dateRequest_picker',
                  label: 'Ngày yêu cầu',
                  icon: Icons.calendar_today,
                  inputType: InputType.date,
                  format: _dateFormat,
                  isRequired: true,
                  initialValue: DateTime.now(),
                  validator: FormBuilderValidators.required(
                    errorText: 'Vui lòng chọn ngày yêu cầu',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Loại xe
          RentalVehicleSelectField<RentalVehicleVehicleType>(
            nameForm: 'vehicleType',
            label: 'Loại xe',
            icon: Icons.local_shipping_outlined,
            items: vehicleTypes,
            sheetTitle: 'Chọn loại xe',
            displayText: (t) => t.name ?? '—',
            initialSelectedItem: selectedVehicleType,
            onSelected: onVehicleTypeChanged,
            errorText: 'Vui lòng chọn loại xe',
          ),
          const SizedBox(height: 12),

          // Người yêu cầu
          RentalVehicleSelectField<RentalVehicleEmployee>(
            nameForm: 'employeeRequestId',
            label: 'Người yêu cầu',
            icon: Icons.person_outline,
            items: employees,
            sheetTitle: 'Chọn người yêu cầu',
            displayText: formatRentalVehicleEmployeeLabel,
            initialSelectedItem: selectedEmployee,
            onSelected: onEmployeeChanged,
            errorText: 'Vui lòng chọn người yêu cầu',
          ),
          const SizedBox(height: 12),

          // Phòng ban (disable, hiện theo người yêu cầu)
          AbsorbPointer(
            child: FormInputField(
              nameForm: 'departmentName',
              nameTextField: 'departmentName_text',
              label: 'Phòng ban',
              icon: Icons.business_outlined,
              readOnly: true,
              enabled: false,
              initialValue: selectedEmployee?.departmentName ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
