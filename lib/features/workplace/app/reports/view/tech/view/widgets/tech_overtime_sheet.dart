// Bottom sheet khai báo ca làm thêm (OT) cho báo cáo kỹ thuật.
//
// Mỗi ca làm thêm là 1 tab trong sheet (Ca 1, Ca 2, ...). Tiêu đề tab hiển thị
// khoảng thời gian của ca, tổng số giờ của ca và dấu hiệu phụ cấp ăn tối.
// Nút "+" trên thanh tab tạo ca mới với khung giờ tịnh tiến 2 tiếng so với ca
// liền trước (tối đa 23:59).
//
// Góc trên bên phải hiển thị tổng số giờ làm thêm của cả hạng mục. Dưới cùng
// sheet có 2 nút: "Xoá" (xoá ca đang chọn) và "Xong" (đóng sheet).
//
// Thoát sheet (vuốt / bấm ra ngoài / nút back) không hỏi lại — dữ liệu đã nhập
// được giữ nguyên. Chỉ khi xoá toàn bộ phiếu làm thêm hoặc bỏ tick "Có làm thêm"
// ở màn chính thì mới hỏi xác nhận.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../../reg_work/view/pages/overtime/data/datasource/models/overtime_model.dart';
import '../../../../../reg_work/view/pages/overtime/view/widgets/overtime_add_constants.dart';
import '../../data/tech_location.dart';
import '../../data/tech_model.dart';
import '../bloc/tech_bloc.dart';

/// Mở bottom sheet khai báo ca làm thêm cho một hạng mục công việc.
///
/// [initialTabIndex] là ca được chọn khi mở sheet (dùng khi người dùng bấm vào
/// 1 ca trong danh sách rút gọn trên màn chính).
Future<void> openTechOvertimeSheet({
  required BuildContext context,
  required TechBloc bloc,
  required int workIndex,
  required DateTime reportDate,
  int initialTabIndex = 0,
}) async {
  await Navigator.of(context).push(
    ModalSheetRoute(
      swipeDismissible: true,
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: TechOvertimeSheet(
          workIndex: workIndex,
          reportDate: reportDate,
          initialTabIndex: initialTabIndex,
        ),
      ),
    ),
  );
}

/// Bottom sheet nhiều tab, mỗi tab là 1 ca làm thêm.
class TechOvertimeSheet extends StatefulWidget {
  const TechOvertimeSheet({
    super.key,
    required this.workIndex,
    required this.reportDate,
    this.initialTabIndex = 0,
  });

  /// Index của hạng mục trong danh sách works (dùng để dispatch event).
  final int workIndex;

  /// Ngày báo cáo — mọi mốc giờ làm thêm đều neo vào ngày này.
  final DateTime reportDate;

  /// Ca được chọn sẵn khi mở sheet.
  final int initialTabIndex;

  @override
  State<TechOvertimeSheet> createState() => _TechOvertimeSheetState();
}

class _TechOvertimeSheetState extends State<TechOvertimeSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Ca đang hiển thị trong sheet.
  int _selectedIndex = 0;

  /// Đánh dấu cần chuyển sang ca mới nhất sau khi bloc cập nhật danh sách ca.
  bool _pendingSelectLastTab = false;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTabIndex;
  }

  /// Ca làm thêm hiện tại của hạng mục đang mở.
  List<OvertimeSession> _sessionsOf(TechState state) {
    final works = state.selectedProject?.works ?? const <TechWork>[];
    if (widget.workIndex < 0 || widget.workIndex >= works.length) {
      return const <OvertimeSession>[];
    }
    return works[widget.workIndex].overtimes;
  }

  /// Chỉ được khai báo ca làm thêm mới cho hôm nay hoặc hôm qua.
  bool get _canCreateNew {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    return widget.reportDate == today || widget.reportDate == yesterday;
  }

  /// Đóng sheet (giữ nguyên dữ liệu đã nhập).
  void _close() {
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  /// Đóng sheet sau khi kiểm tra validate toàn bộ ca làm thêm.
  ///
  /// Chỉ đóng khi mọi ca đều hợp lệ; nếu không thì báo lỗi, chuyển sang ca
  /// đang lỗi và highlight lỗi ngay tại các trường tương ứng.
  void _confirmClose() {
    if (!mounted) return;

    final sessions = _sessionsOf(context.read<TechBloc>().state);

    for (var i = 0; i < sessions.length; i++) {
      final error = OvertimeSession.validate(
        sessions[i],
        reportDate: widget.reportDate,
        // Lý do do người dùng vừa gõ — ưu tiên giá trị live của form.
        reason: i == _selectedIndex ? _liveReason : null,
      );
      if (error == null) continue;

      setState(() => _selectedIndex = i);

      // Highlight lỗi ngay tại các trường của ca đang lỗi.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _formKey.currentState?.validate();
      });

      context.showMessage('Ca ${i + 1}: $error', type: SnackBarType.error);
      return;
    }

    // Validate các trường đang hiển thị (định dạng ngày/giờ, trường bắt buộc).
    if (_formKey.currentState?.saveAndValidate() != true) return;

    _close();
  }

  /// Lý do làm thêm đang gõ ở ca hiện tại (lấy trực tiếp từ form).
  String? get _liveReason {
    final key = 'tech_ot_sheet_reason_${widget.workIndex}_$_selectedIndex';
    final value = _formKey.currentState?.instantValue[key];
    return value is String ? value : null;
  }

  /// Thêm ca làm thêm mới (Ca n+1) và chuyển sang ca vừa thêm.
  void _addShift(List<OvertimeSession> sessions) {
    if (!_canCreateNew) return;

    // Tối đa 3 ca làm thêm/ngày — vượt quá thì báo khai báo làm đêm.
    if (sessions.length >= OvertimeSession.maxShifts) {
      context.showMessage(
        OvertimeSession.maxShiftsMessage,
        type: SnackBarType.error,
      );
      return;
    }

    // Bloc xử lý event bất đồng bộ → đánh dấu cần chọn ca mới, thực hiện
    // chuyển tab sau khi danh sách ca đã được cập nhật.
    _pendingSelectLastTab = true;

    context.read<TechBloc>().add(
      TechEvent.addOvertimeSession(index: widget.workIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.85;

    return Sheet(
      initialOffset: const SheetOffset(0.0),
      decoration: const MaterialSheetDecoration(
        size: SheetSize.fit,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: FormBuilder(
          key: _formKey,
          child: BlocBuilder<TechBloc, TechState>(
            buildWhen: (prev, curr) =>
                prev.selectedProject != curr.selectedProject ||
                prev.approvers != curr.approvers ||
                prev.overtimeTypes != curr.overtimeTypes,
            builder: (context, state) {
              final sessions = _sessionsOf(state);

              // Sau khi bloc thêm ca mới → chuyển sang ca vừa thêm.
              if (_pendingSelectLastTab && sessions.isNotEmpty) {
                _pendingSelectLastTab = false;
                if (_selectedIndex != sessions.length - 1) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted) return;
                    setState(() => _selectedIndex = sessions.length - 1);
                  });
                }
              }

              final selectedIndex = _selectedIndex.clamp(
                0,
                sessions.isEmpty ? 0 : sessions.length - 1,
              );

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildHeader(context, sessions),
                  const Divider(height: 1),
                  Expanded(
                    child: Column(
                      children: [
                        _buildTabStrip(context, sessions, selectedIndex),
                        const Divider(height: 1),
                        Expanded(
                          child: sessions.isEmpty
                              ? _EmptyShiftBox(canCreateNew: _canCreateNew)
                              : SingleChildScrollView(
                                  padding: const EdgeInsets.fromLTRB(
                                    16,
                                    12,
                                    16,
                                    12,
                                  ),
                                  child: _OvertimeShiftForm(
                                    key: ValueKey(
                                      'ot_shift_${widget.workIndex}_$selectedIndex',
                                    ),
                                    session: sessions[selectedIndex],
                                    sessionIndex: selectedIndex,
                                    workIndex: widget.workIndex,
                                    dayStart: widget.reportDate,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  _buildBottomActions(context, sessions),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// Thanh action dưới cùng: "Xoá" ca đang chọn và "Xong" đóng sheet.
  Widget _buildBottomActions(
    BuildContext context,
    List<OvertimeSession> sessions,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.borderColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: sessions.isEmpty
                  ? null
                  : () => _removeCurrentShift(context),
              icon: const Icon(Icons.delete_outline, size: 18),
              label: const Text('Xoá'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent,
                side: const BorderSide(color: Colors.redAccent),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: _confirmClose,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Xong',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Xoá ca đang chọn trong sheet (hỏi xác nhận nếu là phiếu cuối cùng).
  Future<void> _removeCurrentShift(BuildContext context) async {
    final bloc = context.read<TechBloc>();
    final works = bloc.state.selectedProject?.works ?? const <TechWork>[];
    if (widget.workIndex >= works.length) return;

    final sessions = works[widget.workIndex].overtimes;
    if (sessions.isEmpty) return;

    final sessionIndex = _selectedIndex.clamp(0, sessions.length - 1);

    if (sessions.length <= 1) {
      final confirmed = await DialogService.showConfirmDialog(
        context: context,
        title: 'Xác nhận xoá ca làm thêm',
        message:
            'Bạn có chắc muốn xoá ca làm thêm này không? "Có làm thêm" sẽ được bỏ chọn.',
      );
      if (!confirmed || !mounted) return;
    }

    bloc.add(
      TechEvent.removeOvertimeSession(
        index: widget.workIndex,
        sessionIndex: sessionIndex,
      ),
    );

    if (!mounted) return;
    setState(() => _selectedIndex = 0);
  }

  /// Header: tiêu đề + tổng số giờ làm thêm của hạng mục.
  Widget _buildHeader(BuildContext context, List<OvertimeSession> sessions) {
    final totalHours = sessions.fold<double>(
      0,
      (sum, s) => sum + (s.timeReality > 0 ? s.timeReality : 0),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Khai báo ca làm thêm',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primaryERP.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.timer_outlined,
                  size: 14,
                  color: AppColors.primaryERP,
                ),
                const SizedBox(width: 4),
                Text(
                  'Tổng ${_formatHours(totalHours)}h',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryERP,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Thanh tab: mỗi ca 1 chip (Ca n - giờ bắt đầu - giờ kết thúc) + nút thêm.
  Widget _buildTabStrip(
    BuildContext context,
    List<OvertimeSession> sessions,
    int selectedIndex,
  ) {
    return SizedBox(
      height: 46,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        children: [
          for (var i = 0; i < sessions.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildTabChip(context, sessions[i], i, i == selectedIndex),
            ),
          if (_canCreateNew)
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => _addShift(sessions),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primaryERP),
                ),
                child: const Icon(
                  Icons.add_rounded,
                  size: 18,
                  color: AppColors.primaryERP,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Chip hiển thị 1 ca: `Ca n (18:00 - 20:00) 2h` + icon phụ cấp ăn tối.
  Widget _buildTabChip(
    BuildContext context,
    OvertimeSession session,
    int index,
    bool isSelected,
  ) {
    final hours = session.timeReality > 0 ? session.timeReality : 0.0;
    final color = isSelected ? AppColors.primaryERP : Colors.grey.shade700;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryERP.withValues(alpha: 0.12)
              : Colors.grey.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryERP : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ca ${index + 1} (${_formatTime(session.timeStart)} - '
              '${_formatTime(session.endTime)})',
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '${_formatHours(hours)}h',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            if (session.overnight) ...[
              const SizedBox(width: 4),
              const Icon(
                Icons.restaurant_rounded,
                size: 13,
                color: AppColors.warning,
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Định dạng giờ `HH:mm`.
  static String _formatTime(DateTime? time) {
    if (time == null) return '--:--';
    return DateFormat('HH:mm').format(time);
  }

  /// Định dạng số giờ — bỏ phần thập phân 0 (VD: 2 → `2`, 2.5 → `2,5`).
  static String _formatHours(double value) {
    if (value == value.toInt()) return value.toInt().toString();
    return value.toString().replaceFirst('.', ',');
  }
}

/// Thông báo khi chưa có ca làm thêm nào trong sheet.
class _EmptyShiftBox extends StatelessWidget {
  const _EmptyShiftBox({required this.canCreateNew});

  final bool canCreateNew;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.nightlight_round, size: 40, color: AppColors.gray),
            const SizedBox(height: 8),
            Text(
              canCreateNew
                  ? 'Chưa có ca làm thêm nào.'
                  : 'Chỉ được khai báo ca làm thêm mới cho hôm nay hoặc hôm qua.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: AppColors.hintText),
            ),
          ],
        ),
      ),
    );
  }
}

/// Form nhập chi tiết của 1 ca làm thêm.
class _OvertimeShiftForm extends StatefulWidget {
  const _OvertimeShiftForm({
    super.key,
    required this.session,
    required this.sessionIndex,
    required this.workIndex,
    required this.dayStart,
  });

  final OvertimeSession session;
  final int sessionIndex;
  final int workIndex;

  /// Đầu ngày báo cáo — mọi mốc giờ làm thêm đều neo vào ngày này.
  final DateTime dayStart;

  @override
  State<_OvertimeShiftForm> createState() => _OvertimeShiftFormState();
}

class _OvertimeShiftFormState extends State<_OvertimeShiftForm> {
  late final TextEditingController _reasonController;

  /// Text hiển thị của các trường chọn bằng bottom sheet.
  late final TextEditingController _approverController;
  late final TextEditingController _typeController;
  late final TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _reasonController = TextEditingController(text: widget.session.reason);
    _approverController = TextEditingController(
      text: _approverNameOf(widget.session.approvedId),
    );
    _typeController = TextEditingController(
      text: _typeLabelOf(widget.session.typeId),
    );
    _locationController = TextEditingController(
      text: _locationLabelOf(widget.session.location),
    );
  }

  @override
  void didUpdateWidget(covariant _OvertimeShiftForm oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.session.reason != widget.session.reason &&
        _reasonController.text != widget.session.reason) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _reasonController.value = TextEditingValue(
          text: widget.session.reason,
          selection: TextSelection.collapsed(
            offset: widget.session.reason.length,
          ),
        );
      });
    }

    // Đồng bộ nhãn hiển thị khi danh sách người duyệt / loại làm thêm tải về
    // muộn hơn thời điểm mở sheet.
    _syncLabel(_approverController, _approverNameOf(widget.session.approvedId));
    _syncLabel(_typeController, _typeLabelOf(widget.session.typeId));
    _syncLabel(_locationController, _locationLabelOf(widget.session.location));

    // Đồng bộ tick "Phụ cấp ăn tối" khi bloc tự động bật (ca 18:00 - 20:00).
    _syncOvernight(oldWidget.session.overnight, widget.session.overnight);
  }

  /// Đồng bộ trạng thái tick phụ cấp ăn tối với giá trị trong bloc.
  ///
  /// `initialValue` của form field chỉ áp dụng lúc đăng ký field nên khi bloc
  /// tự động bật tick (ca 18:00 - 20:00) cần gán lại giá trị cho field.
  void _syncOvernight(bool oldValue, bool newValue) {
    if (oldValue == newValue) return;

    final name =
        'tech_ot_sheet_overnight_${widget.workIndex}_${widget.sessionIndex}';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final field = FormBuilder.of(context)?.fields[name];
      if (field == null) return;
      if (field.value == newValue) return;
      field.setValue(newValue);
    });
  }

  /// Cập nhật text của controller khi khác với giá trị mong muốn.
  void _syncLabel(TextEditingController controller, String text) {
    if (controller.text == text) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (controller.text == text) return;
      controller.value = TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    });
  }

  @override
  void dispose() {
    _reasonController.dispose();
    _approverController.dispose();
    _typeController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  /// Tên người duyệt theo ID (tra trong danh sách người duyệt của bloc).
  String _approverNameOf(int approvedId) {
    final state = context.read<TechBloc>().state;

    for (final approver in state.approvers) {
      if (approvedOvertimePayloadValue(approver) == approvedId) {
        return '${approver.code ?? ''} - ${approver.fullName ?? ''}'.trim();
      }
    }

    return '';
  }

  /// Nhãn của loại làm thêm theo mã.
  String _typeLabelOf(int typeId) {
    final types = context.read<TechBloc>().state.overtimeTypes;

    for (final type in types) {
      if (type.id == typeId) return _typeDisplay(type);
    }

    return '';
  }

  /// Nhãn của địa điểm làm thêm theo mã.
  ///
  /// Dùng chung text với "Nơi làm việc" ở màn báo cáo (Văn phòng RTC,
  /// Nhà máy RTC, Địa điểm công tác, Tại nhà).
  static String _locationLabelOf(int location) =>
      TechLocation.overtimeLocationLabel(location);

  /// Mốc cuối được chọn — 23:59 của ngày báo cáo.
  ///
  /// Ca làm thêm phải nằm trong ngày báo cáo nên không cho chọn sang ngày khác.
  DateTime get _lastPickableMoment =>
      widget.dayStart.add(const Duration(hours: 23, minutes: 59));

  /// Hiển thị loại làm thêm (VD: `Ngày thường`).
  static String _typeDisplay(OvertimeType type) => (type.type ?? '').trim();

  /// Chọn người duyệt trong bottom sheet.
  Future<void> _pickApprover() async {
    final bloc = context.read<TechBloc>();
    final items = bloc.state.approvers
        .where((e) => e.isDeleted != true)
        .toList();

    if (items.isEmpty) {
      context.showMessage('Chưa có người duyệt', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<ApproverItem>(
      context: context,
      title: 'Chọn người duyệt',
      items: items,
      displayText: (a) => '${a.code ?? ''} - ${a.fullName ?? ''}'.trim(),
      onSelected: (item) {
        final idValue = approvedOvertimePayloadValue(item);
        _approverController.text = '${item.code ?? ''} - ${item.fullName ?? ''}'
            .trim();
        bloc.add(
          TechEvent.updateOvertimeSession(
            index: widget.workIndex,
            sessionIndex: widget.sessionIndex,
            approvedId: idValue,
          ),
        );
      },
    );
  }

  /// Chọn loại làm thêm trong bottom sheet.
  Future<void> _pickType() async {
    final bloc = context.read<TechBloc>();
    final items = bloc.state.overtimeTypes
        .where((e) => e.isDeleted != true)
        .toList();

    if (items.isEmpty) {
      context.showMessage('Chưa có loại làm thêm', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<OvertimeType>(
      context: context,
      title: 'Chọn loại làm thêm',
      items: items,
      displayText: _typeDisplay,
      onSelected: (type) {
        _typeController.text = _typeDisplay(type);
        bloc.add(
          TechEvent.updateOvertimeSession(
            index: widget.workIndex,
            sessionIndex: widget.sessionIndex,
            typeId: type.id,
          ),
        );
      },
    );
  }

  /// Chọn địa điểm làm thêm trong bottom sheet.
  ///
  /// Dùng chung danh sách & text với "Nơi làm việc" ở màn báo cáo. Thay đổi
  /// ở đây chỉ áp dụng cho ca làm thêm, không ảnh hưởng nơi làm việc chung.
  Future<void> _pickLocation() async {
    final bloc = context.read<TechBloc>();

    await openSelectBottomSheet<String>(
      context: context,
      title: 'Chọn địa điểm làm thêm',
      items: TechLocation.options,
      displayText: (v) => v,
      onSelected: (option) {
        final value = TechLocation.overtimeLocationOf(option);
        _locationController.text = option;
        bloc.add(
          TechEvent.updateOvertimeSession(
            index: widget.workIndex,
            sessionIndex: widget.sessionIndex,
            location: value,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TechBloc>();
    final session = widget.session;
    final suffix = '${widget.workIndex}_${widget.sessionIndex}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Từ / Đến (chọn ngày - giờ, chỉ trong ngày báo cáo) ──
        FormDateTimePicker(
          nameForm: 'tech_ot_sheet_start_$suffix',
          nameTimePicker: 'tech_ot_sheet_start_inner_$suffix',
          label: 'Từ',
          icon: Icons.play_arrow_rounded,
          inputType: InputType.both,
          format: DateFormat('dd/MM/yyyy HH:mm'),
          initialValue: session.timeStart,
          initialDate: widget.dayStart,
          firstDate: widget.dayStart,
          lastDate: _lastPickableMoment,
          isRequired: true,
          onChanged: (value) {
            if (value == null) return;
            bloc.add(
              TechEvent.updateOvertimeSession(
                index: widget.workIndex,
                sessionIndex: widget.sessionIndex,
                timeStart: value,
              ),
            );
          },
        ),
        const SizedBox(height: 14),
        FormDateTimePicker(
          nameForm: 'tech_ot_sheet_end_$suffix',
          nameTimePicker: 'tech_ot_sheet_end_inner_$suffix',
          label: 'Đến',
          icon: Icons.stop_rounded,
          inputType: InputType.both,
          format: DateFormat('dd/MM/yyyy HH:mm'),
          initialValue: session.endTime,
          initialDate: widget.dayStart,
          firstDate: widget.dayStart,
          lastDate: _lastPickableMoment,
          isRequired: true,
          onChanged: (value) {
            if (value == null) return;
            bloc.add(
              TechEvent.updateOvertimeSession(
                index: widget.workIndex,
                sessionIndex: widget.sessionIndex,
                endTime: value,
              ),
            );
          },
          validator: (value) {
            if (value == null) return 'Vui lòng chọn thời gian kết thúc';
            final start = session.timeStart;
            if (start != null && !value.isAfter(start)) {
              return 'Thời gian kết thúc phải sau thời gian bắt đầu';
            }
            return null;
          },
        ),
        const SizedBox(height: 14),
        // ── Người duyệt ──
        FormInputField(
          nameForm: 'tech_ot_sheet_approver_$suffix',
          nameTextField: 'tech_ot_sheet_approver_tf_$suffix',
          label: 'Người duyệt',
          icon: Icons.person_outlined,
          readOnly: true,
          controller: _approverController,
          isRequired: true,
          onTap: _pickApprover,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Vui lòng chọn người duyệt';
            }
            return null;
          },
        ),
        const SizedBox(height: 14),
        // ── Loại làm thêm ──
        FormInputField(
          nameForm: 'tech_ot_sheet_type_$suffix',
          nameTextField: 'tech_ot_sheet_type_tf_$suffix',
          label: 'Loại làm thêm',
          icon: Icons.category_outlined,
          readOnly: true,
          controller: _typeController,
          isRequired: true,
          onTap: _pickType,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Vui lòng chọn loại làm thêm';
            }
            return null;
          },
        ),
        const SizedBox(height: 14),
        // ── Địa điểm ──
        FormInputField(
          nameForm: 'tech_ot_sheet_location_$suffix',
          nameTextField: 'tech_ot_sheet_location_tf_$suffix',
          label: 'Địa điểm',
          icon: Icons.location_on_outlined,
          readOnly: true,
          controller: _locationController,
          isRequired: true,
          onTap: _pickLocation,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Vui lòng chọn địa điểm làm thêm';
            }
            return null;
          },
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: FormCheckbox(
            name: 'tech_ot_sheet_overnight_$suffix',
            title: const Text(
              'Phụ cấp ăn tối',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            initialValue: session.overnight,
            onChanged: (value) {
              bloc.add(
                TechEvent.updateOvertimeSession(
                  index: widget.workIndex,
                  sessionIndex: widget.sessionIndex,
                  overnight: value ?? false,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        FormInputField(
          nameForm: 'tech_ot_sheet_reason_$suffix',
          nameTextField: 'tech_ot_sheet_reason_tf_$suffix',
          label: 'Lý do làm thêm',
          icon: Icons.note_alt_outlined,
          maxLines: 2,
          textInputAction: TextInputAction.newline,
          autoExpand: true,
          controller: _reasonController,
          isRequired: true,
          onChanged: (value) {
            bloc.add(
              TechEvent.updateOvertimeSession(
                index: widget.workIndex,
                sessionIndex: widget.sessionIndex,
                reason: value,
              ),
            );
          },
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Vui lòng nhập lý do làm thêm';
            }
            return null;
          },
        ),
      ],
    );
  }
}
