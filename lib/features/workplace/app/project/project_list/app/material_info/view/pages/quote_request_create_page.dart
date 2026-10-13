import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/form_card.dart';
import '../../../../../../../../../common/widgets/form/form_date_time_picker.dart';
import '../../../../../../../../../common/widgets/form/form_input_field.dart';
import '../../../material_category/data/datasource/model/part_list_model.dart';

/// Trang tạo yêu cầu báo giá từ danh sách vật tư đã chọn.
///
/// Mở qua `Navigator.push(MaterialPageRoute(... QuoteRequestCreatePage))`.
/// Trả về `true` nếu user bấm "Xác nhận", `false` (hoặc null) nếu huỷ / back.
///
/// Form gồm:
/// - Deadline báo giá (chọn ngày).
/// - Bảng danh sách vật tư đã chọn (read-only).
/// - Ghi chú (tuỳ chọn).
/// - 2 nút "Huỷ" / "Xác nhận".
class QuoteRequestCreatePage extends StatefulWidget {
  const QuoteRequestCreatePage({super.key, required this.selectedItems});

  /// Danh sách vật tư sau khi đã được chuẩn hoá từ cây cha-con.
  /// Page chỉ hiển thị, không tự lọc.
  final List<PartListModel> selectedItems;

  @override
  State<QuoteRequestCreatePage> createState() => _QuoteRequestCreatePageState();
}

class _QuoteRequestCreatePageState extends State<QuoteRequestCreatePage>
    with BaseMethodMixin<BaseBlocState> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _onCancel() => Navigator.of(context).pop(false);

  void _onConfirm() {
    if (widget.selectedItems.isEmpty) {
      showMessage(
        context,
        'Không có vật tư nào được chọn',
        type: SnackBarType.error,
      );
      return;
    }
    // Validate form (ghi chú tuỳ chọn, chỉ cần chạy validator để chặn
    // trường hợp nhập >500 ký tự hoặc toàn khoảng trắng).
    if (!(_formKey.currentState?.validate() ?? true)) return;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: const Text('Yêu cầu báo giá'),
        onBackTap: () => Navigator.of(context).pop(false),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormCard(
                      child: FormDateTimePicker(
                        icon: Icons.calendar_today,
                        nameForm: 'quote_request_deadline',
                        nameTimePicker: 'deadline',
                        label: 'Deadline báo giá',
                        inputType: InputType.date,
                        isRequired: true,
                        validator: FormBuilderValidators.required(
                          errorText: 'Vui lòng chọn deadline báo giá',
                        ),
                        format: DateFormat('dd/MM/yyyy'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _MaterialListSection(items: widget.selectedItems),
                    const SizedBox(height: 20),
                    FormCard(
                      child: FormInputField(
                        icon: Icons.note_alt_outlined,
                        nameForm: 'quote_request_note',
                        nameTextField: 'note',
                        label: 'Ghi chú (nếu có)',
                        isRequired: false,
                        autoExpand: true,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        onChanged: (v) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _BottomActions(onCancel: _onCancel, onConfirm: _onConfirm),
          ],
        ),
      ),
    );
  }
}

/// Bảng danh sách vật tư: 10 cột, cuộn ngang, header sticky.
///
/// Cột: TT · Mã · Tên vật tư · Hãng · ĐVT · SL · Tiền · Giá Target ·
/// LeadTime · Ghi chú. Chiều rộng từng cột cố định (không flex) để header
/// và body luôn thẳng hàng khi cuộn ngang.
class _MaterialListSection extends StatelessWidget {
  const _MaterialListSection({required this.items});

  final List<PartListModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Danh sách vật tư',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.enableText,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primaryERP.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${items.length}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryERP,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            // Cuộn ngang để hiện đủ 10 cột trên màn hẹp.
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _TableHeader(),
                  const Divider(height: 1, color: Color(0xFFE2E8F0)),
                  if (items.isEmpty)
                    const _EmptyRow()
                  else
                    ...List.generate(items.length, (index) {
                      return _MaterialRow(
                        item: items[index],
                        showDivider: index < items.length - 1,
                      );
                    }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Độ rộng cố định từng cột — dùng chung cho header và body.
/// Tổng ~884px, vừa đủ để thấy đa số cột trên tablet và buộc cuộn ngang
/// trên phone nhỏ.
class _ColWidths {
  static const double tt = 44;
  static const double code = 200;
  static const double name = 180;
  static const double maker = 110;
  static const double unit = 56;
  static const double qty = 70;
  static const double currency = 64;
  static const double target = 90;
  static const double lead = 70;
  static const double note = 130;

  /// Tổng chiều rộng bảng = tổng width các cột. Header, body, empty đều
  /// dùng cùng giá trị này để luôn thẳng hàng khi cuộn ngang.
  static const double total =
      tt + code + name + maker + unit + qty + currency + target + lead + note;
}

/// Header bảng vật tư — 10 cột, sticky theo chiều ngang (cuộn cùng body).
class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _ColWidths.total,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(color: Color(0xFFF8FAFC)),
      child: const Row(
        children: [
          _HeaderCell(text: 'TT', width: _ColWidths.tt),
          _HeaderCell(text: 'Mã', width: _ColWidths.code),
          _HeaderCell(text: 'Tên vật tư', width: _ColWidths.name),
          _HeaderCell(text: 'Hãng', width: _ColWidths.maker),
          _HeaderCell(text: 'ĐVT', width: _ColWidths.unit),
          _HeaderCell(text: 'SL', width: _ColWidths.qty, align: TextAlign.end),
          _HeaderCell(
            text: 'Tiền',
            width: _ColWidths.currency,
            align: TextAlign.center,
          ),
          _HeaderCell(
            text: 'Giá Target',
            width: _ColWidths.target,
            align: TextAlign.end,
          ),
          _HeaderCell(
            text: 'LeadTime',
            width: _ColWidths.lead,
            align: TextAlign.center,
          ),
          _HeaderCell(text: 'Ghi chú', width: _ColWidths.note),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell({
    required this.text,
    required this.width,
    this.align = TextAlign.start,
  });

  final String text;
  final double width;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          text,
          textAlign: align,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.gray,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}

/// Empty state — full width của bảng.
class _EmptyRow extends StatelessWidget {
  const _EmptyRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _ColWidths.total,
      padding: const EdgeInsets.symmetric(vertical: 24),
      alignment: Alignment.center,
      child: const Text(
        'Chưa có vật tư nào được chọn',
        style: TextStyle(fontSize: 13, color: AppColors.gray),
      ),
    );
  }
}

/// 1 dòng vật tư — 10 cột, cùng width với header.
class _MaterialRow extends StatelessWidget {
  const _MaterialRow({required this.item, required this.showDivider});

  final PartListModel item;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    // STT lấy từ API, hiển thị nguyên giá trị (kể cả số lớn, chuỗi "1.1").
    final tt = (item.tt ?? '').isNotEmpty
        ? item.tt!
        : (item.stt?.toString() ?? '--');
    final code = (item.productCode ?? '').isNotEmpty ? item.productCode! : '--';
    final name = (item.groupMaterial ?? '').isNotEmpty
        ? item.groupMaterial!
        : 'Vật tư';
    final maker = (item.manufacturer ?? '').isNotEmpty
        ? item.manufacturer!
        : '--';
    final unit = (item.unit ?? '').isNotEmpty ? item.unit! : '--';
    // SL = QtyFull theo yêu cầu.
    final qty = _fmtQty(item.qtyFull);
    final currency = (item.currencyCode ?? '').isNotEmpty
        ? item.currencyCode!
        : '--';
    final target = _fmtMoney(item.targetPrice);
    // LeadTime ưu tiên LeadTimeTechnical (số ngày), fallback text nếu có.
    final lead = item.leadTimeTechnical != null
        ? '${item.leadTimeTechnical}d'
        : '--';
    final note = (item.note ?? '').isNotEmpty ? item.note! : '--';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: _ColWidths.total,
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Cell(text: tt, width: _ColWidths.tt, weight: FontWeight.w600),
              _Cell(
                text: code,
                width: _ColWidths.code,
                weight: FontWeight.w600,
              ),
              _Cell(text: name, width: _ColWidths.name, wrap: true),
              _Cell(text: maker, width: _ColWidths.maker),
              _Cell(
                text: unit,
                width: _ColWidths.unit,
                align: TextAlign.center,
              ),
              _Cell(
                text: qty,
                width: _ColWidths.qty,
                align: TextAlign.end,
                weight: FontWeight.w600,
              ),
              _Cell(
                text: currency,
                width: _ColWidths.currency,
                align: TextAlign.center,
              ),
              _Cell(
                text: target,
                width: _ColWidths.target,
                align: TextAlign.end,
                weight: FontWeight.w600,
              ),
              _Cell(
                text: lead,
                width: _ColWidths.lead,
                align: TextAlign.center,
              ),
              _Cell(text: note, width: _ColWidths.note, maxLines: 2),
            ],
          ),
        ),
        if (showDivider) const Divider(height: 1, color: Color(0xFFE2E8F0)),
      ],
    );
  }

  static String _fmtQty(double? v) {
    if (v == null) return '--';
    return v.toStringAsFixed(0);
  }

  static String _fmtMoney(double? v) {
    if (v == null) return '--';
    if (v == 0) return '--';
    return v.toStringAsFixed(0);
  }
}

/// 1 ô dữ liệu trong dòng — width cố định theo cột.
class _Cell extends StatelessWidget {
  const _Cell({
    required this.text,
    required this.width,
    this.align = TextAlign.start,
    this.weight = FontWeight.w400,
    this.wrap = false,
    this.maxLines = 1,
  });

  final String text;
  final double width;
  final TextAlign align;
  final FontWeight weight;
  final bool wrap;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          text,
          textAlign: align,
          maxLines: wrap ? null : maxLines,
          softWrap: wrap,
          overflow: wrap ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            fontWeight: weight,
            color: text == '--' ? AppColors.gray : AppColors.enableText,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}

/// 2 nút Huỷ / Xác nhận cố định dưới đáy màn hình.
class _BottomActions extends StatelessWidget {
  const _BottomActions({required this.onCancel, required this.onConfirm});

  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, -1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.enableText,
                side: const BorderSide(color: Color(0xFFE2E8F0)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Huỷ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Xác nhận',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}