// Tab "Phiếu đăng ký" trong BookingGuestHouseDetailScreen.
//
// UI y hệt `_buildRegistrationCard()` của `booking_guest_house_add_screen`,
// chỉ khác là ở chế độ "disable" khi phiếu đã được TBP duyệt — toàn bộ field
// hiển thị màu xám (Material InputDecoration tự style khi enabled=false) và
// không cho chọn lại dự án / TBP / tỉnh (không có validator, không có
// onTap mở sheet). Khi CHƯA được TBP duyệt thì field enable bình thường
// (vì bottom bar nút Lưu sẽ wire submit update sau).
// Cấu trúc 7 field theo thứ tự y hệt add_screen:
//   1. Ngày ở      (compact row với Ngày về — thu nhỏ font text dd/MM/yyyy)
//   2. Ngày về
//   3. Dự án
//   4. TBP Duyệt
//   5. Tỉnh lưu trú
//   6. Địa chỉ cụ thể
//   7. Ghi chú
//
// Dữ liệu lấy từ API `GET /AccommodationBooking/accommodation-booking-by-id`:
// - `detail.info` (object `accommodationBooking`) → fill 7 field trên.
// - `detail.persons` (mảng `accommodationDetail`) → fill card "Thông tin
//   người ở", mỗi item render bằng [RoommateInfoItem] readOnly.
//
// Vì `accommodationBooking` chỉ trả về `projectId` / `approvedTBP` (int) /
// `address` (chuỗi rỗng), ta dùng filter list trong bloc state
// (đã load sẵn bằng `loadFilters` ở list screen) để map id → tên cho 3
// field: Dự án, TBP Duyệt, Tỉnh lưu trú.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/booking_guest_house_model.dart';
import '../bloc/booking_guest_house_bloc.dart';
import 'booking_guest_house_status_indicator.dart';
import 'roommate_info_item.dart';

/// Tab Phiếu đăng ký — hiển thị các trường đăng ký của phiếu từ
/// API detail (`accommodationBooking` + `accommodationBookingDetail`).
/// Tất cả field ở trạng thái readOnly.
class BookingGuestHouseRegistrationTab extends StatelessWidget {
  const BookingGuestHouseRegistrationTab({super.key, required this.detail});

  /// Dữ liệu chi tiết phiếu trả về từ API detail.
  final BookingGuestHouseDetailData detail;

  static final DateFormat _dateFmt = DateFormat('dd/MM/yyyy');

  //---(Theme override — thu nhỏ FONT CỦA TEXT HIỂN THỊ (dd/MM/yyyy) bên
  //---trong field, giữ nguyên label. Áp dụng cho 2 field date nằm chung row
  //---(Ngày ở / Ngày về) để trân text tràn ra hoặc bị cắt.---//
  static const _compactFieldTheme = InputDecorationTheme(
    // Chỉ đè style của text trong field (hintText / đang focus / value),
    // không đụng vào labelStyle / floatingLabelStyle → label giữ kích thước
    // mặc định.
    hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
  );

  @override
  Widget build(BuildContext context) {
    final info = detail.info;
    // Phiếu đã được TBP duyệt thì toàn bộ field trên tab Phiếu đăng ký
    // hiển thị màu xám (Material InputDecoration tự style khi enabled=false) —
    // vẫn nhận dữ liệu từ server nhưng không cho thao tác.
    final isApprovedTBP = info.isApprovedTBP == true;
    final status = bookingGuestHouseApprovalStatusFromBool(info.isApprovedTBP);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Indicator duyệt TBP — duy nhất trên tab.
          BookingGuestHouseStatusIndicator(status: status),
          const SizedBox(height: 14),

          // 7 field Thông tin đăng ký — y hệt add_screen.
          FormCard(
            title: 'Thông tin đăng ký',
            child: BlocBuilder<BookingGuestHouseBloc, BookingGuestHouseState>(
              buildWhen: (prev, curr) =>
                  prev.projects != curr.projects ||
                  prev.employees != curr.employees ||
                  prev.provinces != curr.provinces ||
                  prev.selectedProject != curr.selectedProject ||
                  prev.selectedEmployee != curr.selectedEmployee,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //---(Row 1: Ngày ở / Ngày về — thu nhỏ font text hiển thị
                    //    dd/MM/yyyy, label giữ nguyên)---//
                    Theme(
                      data: Theme.of(context).copyWith(
                        inputDecorationTheme: _compactFieldTheme,
                      ),
                      child: Column(
                        children: [
                          FormInputField(
                            nameForm: 'start_date',
                            nameTextField: 'start_date_text',
                            label: 'Ngày ở',
                            icon: Icons.calendar_today_outlined,
                            controller: TextEditingController(
                              text: _formatDate(info.startDate),
                            ),
                            isRequired: true,
                          ),
                          const SizedBox(height: 8),
                          FormInputField(
                            nameForm: 'end_date',
                            nameTextField: 'end_date_text',
                            label: 'Ngày về',
                            icon: Icons.calendar_today_outlined,
                            controller: TextEditingController(
                              text: _formatDate(info.endDate),
                            ),
                            isRequired: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    //---(Dự án — map projectId → tên từ state.projects)---//
                    FormInputField(
                      nameForm: 'project',
                      nameTextField: 'project_text',
                      label: 'Dự án',
                      icon: Icons.account_tree_outlined,
                      controller: TextEditingController(
                        text: _resolveProjectName(info.projectId, state),
                      ),
                      isRequired: true,
                    ),
                    const SizedBox(height: 12),

                    //---(TBP Duyệt — map approvedTBP (employeeId) → tên từ
                    //    state.employees)---//
                    FormInputField(
                      nameForm: 'tbp',
                      nameTextField: 'tbp_text',
                      label: 'TBP Duyệt',
                      icon: Icons.verified_user_outlined,
                      controller: TextEditingController(
                        text: _resolveEmployeeName(
                          info.approvedTBP,
                          state.employees,
                        ),
                      ),
                      enabled: !isApprovedTBP,
                      isRequired: true,
                    ),
                    const SizedBox(height: 12),

                    //---(Tỉnh lưu trú — map provinceId → tên từ
                    //    state.provinces; fallback 'Tỉnh #<id>' nếu không
                    //    resolve được)---//
                    FormInputField(
                      nameForm: 'province',
                      nameTextField: 'province_text',
                      label: 'Tỉnh lưu trú',
                      icon: Icons.location_city_outlined,
                      controller: TextEditingController(
                        text: _resolveProvinceName(info.provinceId, state),
                      ),
                      isRequired: true,
                    ),
                    const SizedBox(height: 12),

                    //---(Địa chỉ cụ thể)---//
                    FormInputField(
                      nameForm: 'address',
                      nameTextField: 'address_text',
                      label: 'Địa chỉ cụ thể',
                      icon: Icons.place_outlined,
                      controller: TextEditingController(
                        text: _displayText(info.address),
                      ),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      autoExpand: true,
                      isRequired: true,
                    ),
                    const SizedBox(height: 12),

                    //---(Ghi chú)---//
                    FormInputField(
                      nameForm: 'note',
                      nameTextField: 'note_text',
                      label: 'Ghi chú',
                      icon: Icons.note_outlined,
                      controller: TextEditingController(
                        text: _displayText(info.note),
                      ),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      autoExpand: true,
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Danh sách người ở cùng — từ `accommodationBookingDetail[]`.
          FormCard(
            title: 'Thông tin người ở',
            child: _buildRoommateList(),
          ),
        ],
      ),
    );
  }

  //---(Section helpers)---//

  /// Hiển thị danh sách người ở cùng: mỗi [BookingDetailPerson] từ API render
  /// thành 1 [RoommateInfoItem] readOnly. Từ response chi tiết ta đã có sẵn
  /// fullName / employeeCode / phoneNumber / departmentName cho mỗi người
  /// nên fill thẳng vào `infoFieldValues` — không cần parse chuỗi.
  Widget _buildRoommateList() {
    final persons = detail.persons;
    if (persons.isEmpty) {
      return Text(
        'Không có người ở cùng',
        style: TextStyle(
          fontSize: 13,
          color: AppColors.gray,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < persons.length; i++) ...[
          _buildRoommateItem(i, persons[i]),
          if (i != persons.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }

  /// Build 1 [RoommateInfoItem] readOnly từ 1 [BookingDetailPerson].
  /// Map từng trường của person xuống `infoFieldValues` để RoommateInfoItem
  /// hydrate controller trong `initState` (qua `_applyStateToControllers`).
  Widget _buildRoommateItem(int index, BookingDetailPerson p) {
    final fullName = (p.fullName ?? '').trim();
    final code = (p.employeeCode ?? '').trim();
    final dept = (p.departmentName ?? '').trim();
    final phone = _phoneToString(p.phoneNumber);

    final infoFieldValues = <String, dynamic>{
      'roommate_full_name_$index': fullName,
      'roommate_full_name_text_$index': fullName,
      'roommate_roommate_name_$index': fullName,
      'roommate_roommate_name_text_$index': fullName,
      'roommate_code_$index': code,
      'roommate_code_text_$index': code,
      'roommate_department_$index': dept,
      'roommate_department_text_$index': dept,
      'roommate_phone_$index': phone,
      'roommate_phone_text_$index': phone,
    };

    return RoommateInfoItem(
      key: ValueKey('detail_roommate_${p.id}'),
      index: index,
      // Truyền rỗng để RoommateInfoItem không mở picker được
      // (chế độ chỉ xem trên detail).
      employeeOptions: const [],
      infoFieldValues: infoFieldValues,
      onChanged: (_) {},
      // Không truyền onRemove → không hiển thị nút xoá.
    );
  }

  //---(Display helpers)---//

  String _displayText(String? value) {
    final s = (value ?? '').trim();
    if (s.isEmpty) return '-';
    return s;
  }

  String _formatDate(DateTime? dt) {
    if (dt == null) return '-';
    return _dateFmt.format(dt);
  }

  /// `PhoneNumber` trong response có thể là int / String / null tuỳ phiên
  /// bản API. Convert an toàn về String rỗng nếu không phải primitive.
  ///
  /// Một số response trả SĐi SĐT thiếu số 0 đầu (ví dụ `832680036` thay vì
  /// `0832680036`). Helper tự prepend `0` khi gặp chuỗi 9 chữ số bắt đầu
  /// bằng ký tự khác `0` để về format chuẩn hiển thị 10 số.
  String _phoneToString(dynamic v) {
    if (v == null) return '';
    String s;
    if (v is String) {
      s = v.trim();
    } else {
      s = v.toString();
    }
    if (s.length == 9 && !s.startsWith('0')) {
      return '0$s';
    }
    return s;
  }

  //---(ID → name resolution)---//

  /// Map `projectId` (int?) → tên dự án từ `state.projects`.
  /// Trả về `'-'` nếu id null / không tìm thấy.
  String _resolveProjectName(int? id, BookingGuestHouseState state) {
    if (id == null) return '-';
    for (final p in state.projects) {
      if (p.id == id) {
        final code = (p.projectCode ?? '').trim();
        final name = (p.projectName ?? '').trim();
        if (code.isEmpty && name.isEmpty) return '';
        if (code.isEmpty) return name;
        if (name.isEmpty) return code;
        return '$code - $name';
      }
    }
    // Không resolve được (id chưa nằm trong list filter) → trống, không
    // hiển thị '#<id>' để tránh phơi id nội bộ ra UI.
    return '';
  }

  /// Map `employeeId` (int?) → tên nhân viên từ danh sách [EmployeeFilterItem]
  /// (đã load trong `state.employees`).
  String _resolveEmployeeName(int? id, List<EmployeeFilterItem> employees) {
    if (id == null) return '-';
    for (final e in employees) {
      if (e.id == id) {
        final name = (e.fullName ?? '').trim();
        if (name.isEmpty) return '';
        return name;
      }
    }
    return '';
  }

  /// Map `provinceId` (int?) → tên tỉnh từ `state.provinces` (đã load
  /// trong `_onLoadFilters`).
  /// Trả về `'-'` nếu id null / không tìm thấy.
  String _resolveProvinceName(int? id, BookingGuestHouseState state) {
    if (id == null) return '-';
    for (final p in state.provinces) {
      if (p.id == id) {
        final name = (p.provinceName ?? '').trim();
        if (name.isEmpty) return '';
        return name;
      }
    }
    return '';
  }
}
