import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';

/// Ô chọn giá trị từ danh mục, dùng chung cho form tạo phiếu lead.
///
/// Hiển thị 1 ô input readonly; chạm vào sẽ mở [openSelectBottomSheet] để
/// người dùng tìm kiếm và chọn 1 mục.
///
/// Mỗi ô gồm 2 field trong FormBuilder:
/// - [textFieldName]: giá trị hiển thị (tên mục đã chọn).
/// - [idFieldName]: mã của mục đã chọn, dùng khi gửi API.
class LeadSelectField<T> extends StatelessWidget {
  const LeadSelectField({
    super.key,
    required this.idFieldName,
    required this.textFieldName,
    required this.label,
    required this.icon,
    required this.sheetTitle,
    required this.items,
    required this.displayText,
    required this.idOf,
    this.searchHint,
    this.isRequired = false,
    this.emptyMessage,
  });

  /// Tên field chứa mã của mục đã chọn.
  final String idFieldName;

  /// Tên field chứa tên hiển thị của mục đã chọn.
  final String textFieldName;

  /// Nhãn hiển thị trên ô input.
  final String label;

  /// Icon hiển thị cạnh nhãn.
  final IconData icon;

  /// Tiêu đề của bottom sheet chọn.
  final String sheetTitle;

  /// Danh sách mục có thể chọn.
  final List<T> items;

  /// Hàm lấy nội dung hiển thị của 1 mục.
  final String Function(T item) displayText;

  /// Hàm lấy mã của 1 mục (dùng khi gửi API).
  final String? Function(T item) idOf;

  /// Gợi ý trong ô tìm kiếm của bottom sheet.
  final String? searchHint;

  /// Bắt buộc chọn.
  final bool isRequired;

  /// Thông báo khi danh mục rỗng.
  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    // Field ẩn chứa mã mục đã chọn.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderField<String>(
          name: idFieldName,
          initialValue: '',
          builder: (_) => const SizedBox.shrink(),
        ),
        GestureDetector(
          onTap: () => _openPicker(context),
          child: AbsorbPointer(
            child: FormInputField(
              readOnly: true,
              nameForm: textFieldName,
              nameTextField: '${textFieldName}_field',
              label: label,
              icon: icon,
              isRequired: isRequired,
              validator: (v) {
                if (isRequired && (v == null || v.trim().isEmpty)) {
                  return 'Vui lòng chọn ${label.toLowerCase()}';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  /// Mở bottom sheet chọn và ghi kết quả vào 2 field của FormBuilder.
  Future<void> _openPicker(BuildContext context) async {
    if (items.isEmpty) {
      context.showMessage(
        emptyMessage ?? 'Chưa có dữ liệu để chọn',
        type: SnackBarType.info,
      );
      return;
    }

    await openSelectBottomSheet<T>(
      context: context,
      title: sheetTitle,
      items: items,
      displayText: displayText,
      hintText: searchHint,
      onSelected: (item) {
        final form = FormBuilder.of(context);
        form?.fields[idFieldName]?.didChange(idOf(item) ?? '');
        form?.fields[textFieldName]?.didChange(displayText(item));
      },
    );
  }
}

/// Nhãn phụ mô tả gợi ý dưới ô chọn (vd: "3 giá trị cố định").
///
/// Dùng để làm rõ các trường không lấy từ API.
class LeadFieldHint extends StatelessWidget {
  const LeadFieldHint({super.key, required this.text});

  /// Nội dung gợi ý.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          color: AppColors.hintText,
          height: 1.3,
        ),
      ),
    );
  }
}
