import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../common/logger/index.dart';
import '../../../../../../../../features/auth/data/datasource/models/user_model.dart';
import '../../../../../../../../features/auth/data/repository/auth_repo.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import '../../data/repo/lead_marketing_repo.dart';

part 'lead_marketing_event.dart';
part 'lead_marketing_state.dart';
part 'lead_marketing_bloc.g.dart';
part 'lead_marketing_bloc.freezed.dart';

/// Bloc xử lý logic nghiệp vụ cho màn Lead Marketing của CRM.
@injectable
class LeadMarketingBloc extends BaseBloc<LeadMarketingEvent, LeadMarketingState> {
  final LeadMarketingRepo _repo;
  final AuthRepo _authRepo;
  final LogUtils _log;

  LeadMarketingBloc(
    this._repo,
    this._authRepo,
    this._log,
  ) : super(LeadMarketingState.init()) {
    on<LeadMarketingEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        changeDateRange: (dateStart, dateEnd) =>
            _onChangeDateRange(emit, dateStart: dateStart, dateEnd: dateEnd),
        changeKeyword: (keyword) => _onChangeKeyword(emit, keyword: keyword),
        refresh: () => _onInit(emit),
        applyFilter: (leadSourceId, marketingEmployeeId, saleEmployeeId,
                includeOpen, stage) =>
            _onApplyFilter(
          emit,
          leadSourceId: leadSourceId,
          marketingEmployeeId: marketingEmployeeId,
          saleEmployeeId: saleEmployeeId,
          includeOpen: includeOpen,
          stage: stage,
        ),
        clearFilter: () => _onClearFilter(emit),
        loadDetail: (id) => _onLoadDetail(emit, id: id),
        loadFiles: (customerContactId) =>
            _onLoadFiles(emit, customerContactId: customerContactId),
        loadFilesPo: (customerContactId) =>
            _onLoadFilesPo(emit, customerContactId: customerContactId),
        loadFormOptions: () => _onLoadFormOptions(emit),
        loadCustomerDetail: (id) => _onLoadCustomerDetail(emit, id: id),
        submitLead: (payload) => _onSubmitLead(emit, payload: payload),
        confirmDuplicateSave: (payload) =>
            _onSubmitLead(emit, payload: payload, skipDuplicateCheck: true),
        cancelDuplicateSave: () async => _onCancelDuplicateSave(emit),
        clearSubmitState: () async => _onClearSubmitState(emit),
        deleteLead: (id) => _onDeleteLead(emit, id: id),
        clearDeleteState: () async => _onClearDeleteState(emit),
      );
    });
  }

  /// Tải quyền, danh sách bộ lọc và danh sách phiếu lead.
  Future<void> _onInit(Emitter<LeadMarketingState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading));

    // Giữ khoảng thời gian đang chọn khi refresh, nếu chưa chọn thì
    // mặc định là 3 tháng gần nhất (từ đầu tháng cách đây 3 tháng đến hôm nay).
    final now = DateTime.now();
    final start = state.dateStart ?? DateTime(now.year, now.month - 3, 1);
    final end = state.dateEnd ?? now;

    await _loadRoleContext(emit);

    await _loadCurrentUser(emit);

    await _loadFilterOptions(emit);

    await _loadLeads(
      emit,
      dateStart: start,
      dateEnd: end,
    );
  }

  /// Tải các danh sách dùng cho bộ lọc: nguồn lead, NV marketing, NV sale.
  ///
  /// Lỗi tải danh sách lọc không chặn việc hiển thị danh sách phiếu lead.
  Future<void> _loadFilterOptions(Emitter<LeadMarketingState> emit) async {
    final sources = await _repo.getLeadSources();
    sources.fold(
      (l) => _log.logE('Get lead sources failed: $l'),
      (r) => emit(state.copyWith(sources: r)),
    );

    final marketing = await _repo.getMarketingEmployees();
    marketing.fold(
      (l) => _log.logE('Get marketing employees failed: $l'),
      (r) => emit(state.copyWith(marketingEmployees: r)),
    );

    final sale = await _repo.getSaleEmployees();
    sale.fold(
      (l) => _log.logE('Get sale employees failed: $l'),
      (r) => emit(state.copyWith(saleEmployees: r)),
    );
  }

  /// Áp dụng bộ lọc — lưu lựa chọn rồi tải lại danh sách phiếu lead.
  Future<void> _onApplyFilter(
    Emitter<LeadMarketingState> emit, {
    required int leadSourceId,
    required int marketingEmployeeId,
    required int saleEmployeeId,
    required bool includeOpen,
    required LeadStage? stage,
  }) async {
    emit(state.copyWith(
      leadSourceId: leadSourceId,
      marketingEmployeeId: marketingEmployeeId,
      saleEmployeeId: saleEmployeeId,
      includeOpen: includeOpen,
      stageFilter: stage,
    ));

    final now = DateTime.now();
    await _loadLeads(
      emit,
      dateStart: state.dateStart ?? DateTime(now.year, now.month - 3, 1),
      dateEnd: state.dateEnd ?? now,
    );
  }

  /// Xóa bộ lọc — đưa tất cả tiêu chí về mặc định rồi tải lại danh sách.
  Future<void> _onClearFilter(Emitter<LeadMarketingState> emit) async {
    emit(state.copyWith(
      leadSourceId: 0,
      marketingEmployeeId: 0,
      saleEmployeeId: 0,
      includeOpen: true,
      stageFilter: null,
    ));

    final now = DateTime.now();
    await _loadLeads(
      emit,
      dateStart: state.dateStart ?? DateTime(now.year, now.month - 3, 1),
      dateEnd: state.dateEnd ?? now,
    );
  }

  /// Tải quyền của người dùng hiện tại trong module Lead.
  Future<void> _loadRoleContext(Emitter<LeadMarketingState> emit) async {
    final res = await _repo.getRoleContext();
    res.fold(
      (l) => _log.logE('Get lead role context failed: $l'),
      (r) => emit(state.copyWith(roleContext: r)),
    );
  }

  /// Thay đổi khoảng thời gian — tải lại danh sách phiếu lead.
  Future<void> _onChangeDateRange(
    Emitter<LeadMarketingState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    await _loadLeads(
      emit,
      dateStart: DateTime(dateStart.year, dateStart.month, dateStart.day),
      dateEnd: DateTime(dateEnd.year, dateEnd.month, dateEnd.day),
    );
  }

  /// Thay đổi từ khoá tìm kiếm — lọc trên dữ liệu đã tải, không gọi lại API.
  Future<void> _onChangeKeyword(
    Emitter<LeadMarketingState> emit, {
    required String keyword,
  }) async {
    emit(state.copyWith(keyword: keyword));
  }

  /// Tải chi tiết phiếu lead kèm hoạt động, lịch sử và quyền thao tác.
  Future<void> _onLoadDetail(
    Emitter<LeadMarketingState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(
      detailStatus: BaseStateStatus.loading,
      detailMessage: null,
    ));

    final res = await _repo.getLeadDetail(id: id);

    await res.fold(
      (l) async {
        _log.logE('Get lead detail failed: $l');
        emit(state.copyWith(
          detailStatus: BaseStateStatus.failed,
          detailMessage: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('Get lead detail success - id: $id');
        emit(state.copyWith(
          detailStatus: BaseStateStatus.success,
          detail: r,
          detailMessage: null,
        ));
      },
    );
  }

  /// Tải danh sách file đính kèm của phiếu lead.
  Future<void> _onLoadFiles(
    Emitter<LeadMarketingState> emit, {
    required int customerContactId,
  }) async {
    emit(state.copyWith(
      filesStatus: BaseStateStatus.loading,
      filesMessage: null,
    ));

    final res = await _repo.getLeadFiles(
      customerContactId: customerContactId,
      fileType: 1,
    );

    await res.fold(
      (l) async {
        _log.logE('Get lead files failed: $l');
        emit(state.copyWith(
          filesStatus: BaseStateStatus.failed,
          filesMessage: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('Get lead files success - count: ${r.length}');
        emit(state.copyWith(
          filesStatus: BaseStateStatus.success,
          files: r,
          filesMessage: null,
          filesLeadId: customerContactId,
        ));
      },
    );
  }

  /// Tải danh sách file PO đính kèm của phiếu lead.
  ///
  /// Dùng `fileType = 2` để lấy nhóm file PO, tách khỏi nhóm file thường.
  Future<void> _onLoadFilesPo(
    Emitter<LeadMarketingState> emit, {
    required int customerContactId,
  }) async {
    emit(state.copyWith(
      filesPoStatus: BaseStateStatus.loading,
      filesPoMessage: null,
    ));

    final res = await _repo.getLeadFiles(
      customerContactId: customerContactId,
      fileType: 2,
    );

    await res.fold(
      (l) async {
        _log.logE('Get lead PO files failed: $l');
        emit(state.copyWith(
          filesPoStatus: BaseStateStatus.failed,
          filesPoMessage: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('Get lead PO files success - count: ${r.length}');
        emit(state.copyWith(
          filesPoStatus: BaseStateStatus.success,
          filesPo: r,
          filesPoMessage: null,
          filesPoLeadId: customerContactId,
        ));
      },
    );
  }

  /// Tải toàn bộ danh mục dùng cho form tạo phiếu lead.
  ///
  /// Gồm: nhóm hàng (loại PO), lĩnh vực, ngành nghề, business field,
  /// tỉnh/thành, khách hàng, nguồn lead và NV marketing. Lỗi tải một
  /// danh mục không chặn các danh mục còn lại.
  Future<void> _onLoadFormOptions(Emitter<LeadMarketingState> emit) async {
    await _loadCurrentUser(emit);

    final poTypes = await _repo.getLeadPoTypes();
    poTypes.fold(
      (l) => _log.logE('Get lead PO types failed: $l'),
      (r) => emit(state.copyWith(poTypes: r)),
    );

    final sources = await _repo.getLeadSources();
    sources.fold(
      (l) => _log.logE('Get lead sources failed: $l'),
      (r) => emit(state.copyWith(sources: r)),
    );

    final marketing = await _repo.getMarketingEmployees();
    marketing.fold(
      (l) => _log.logE('Get marketing employees failed: $l'),
      (r) => emit(state.copyWith(marketingEmployees: r)),
    );

    final industries = await _repo.getCustomerIndustries();
    industries.fold(
      (l) => _log.logE('Get customer industries failed: $l'),
      (r) => emit(state.copyWith(customerIndustries: r)),
    );

    final specializations = await _repo.getCustomerSpecializations();
    specializations.fold(
      (l) => _log.logE('Get customer specializations failed: $l'),
      (r) => emit(state.copyWith(customerSpecializations: r)),
    );

    final businessFields = await _repo.getBusinessFields();
    businessFields.fold(
      (l) => _log.logE('Get business fields failed: $l'),
      (r) => emit(state.copyWith(businessFields: r)),
    );

    final provinces = await _repo.getCustomerProvinces();
    provinces.fold(
      (l) => _log.logE('Get customer provinces failed: $l'),
      (r) => emit(state.copyWith(provinces: r)),
    );

    final customers = await _repo.getCustomers();
    customers.fold(
      (l) => _log.logE('Get customers failed: $l'),
      (r) => emit(state.copyWith(customers: r)),
    );
  }

  /// Tải chi tiết khách hàng để fill sẵn thông tin doanh nghiệp lên form.
  ///
  /// Chi tiết khách hàng chứa sẵn `CustomerIndustriesID`,
  /// `CustomerSpecializationID`, `Province` và `Address` nên người dùng
  /// không phải tự chọn lại 4 trường này.
  Future<void> _onLoadCustomerDetail(
    Emitter<LeadMarketingState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(
      customerDetailStatus: BaseStateStatus.loading,
      customerDetailMessage: null,
    ));

    final res = await _repo.getCustomerDetail(id: id);

    await res.fold(
      (l) async {
        _log.logE('Get customer detail failed: $l');
        emit(state.copyWith(
          customerDetailStatus: BaseStateStatus.failed,
          customerDetailMessage: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('Get customer detail success - id: $id');
        emit(state.copyWith(
          customerDetailStatus: BaseStateStatus.success,
          customerDetail: r,
          customerDetailMessage: null,
        ));
      },
    );
  }

  /// Tải thông tin người dùng hiện tại.
  ///
  /// Dùng để mặc định "NV Marketing phụ trách" trong form tạo phiếu lead.
  Future<void> _loadCurrentUser(Emitter<LeadMarketingState> emit) async {
    final res = await _authRepo.getCurrentUser();
    await res.fold(
      (l) async => _log.logE('Get current user failed: $l'),
      (r) async {
        if (r != null) {
          emit(state.copyWith(currentUser: r));
        }
      },
    );
  }

  /// Kiểm tra trùng lặp rồi lưu phiếu lead.
  ///
  /// Luồng:
  /// 1. `POST /Lead/check-duplicate` với SĐT / email / mã số thuế / tên
  ///    công ty lấy từ [payload] (bỏ qua nếu [skipDuplicateCheck] = true).
  /// 2. Nếu API trả `status = 1` và `data` có bản ghi trùng → dừng lại,
  ///    đưa danh sách trùng ra state để UI hỏi người dùng.
  /// 3. Không trùng (hoặc người dùng đã xác nhận lưu trùng) → gọi tiếp
  ///    `POST /Lead/save-data`.
  /// 4. Lưu thành công → `submitStatus = success`, kèm `message` + `data`
  ///    (ID, LeadCode) để UI xác nhận.
  Future<void> _onSubmitLead(
    Emitter<LeadMarketingState> emit, {
    required Map<String, dynamic> payload,
    bool skipDuplicateCheck = false,
  }) async {
    emit(state.copyWith(
      submitStatus: BaseStateStatus.loading,
      submitMessage: null,
      saveResult: null,
      duplicates: const [],
    ));

    if (!skipDuplicateCheck) {
      // Bước 1: kiểm tra trùng lặp.
      final dupRes = await _repo.checkDuplicate(
        phone: (payload['ContactPhone'] ?? '').toString(),
        email: (payload['ContactEmail'] ?? '').toString(),
        taxCode: (payload['TaxCode'] ?? '').toString(),
        companyName: (payload['CompanyName'] ?? '').toString(),
      );

      // `checkDuplicate` chỉ trả `Right` khi API trả `status = 1` (API đã
      // kiểm tra xong); status khác 1 → repo quy về `Left` kèm message.
      final dupError = await dupRes.fold(
        (l) async => l.getErrorMessage,
        (r) async => null,
      );
      if (dupError != null) {
        _log.logE('Check lead duplicate failed: $dupError');
        emit(state.copyWith(
          submitStatus: BaseStateStatus.failed,
          submitMessage: dupError,
        ));
        return;
      }

      // Bước 2: có bản ghi trùng → hỏi người dùng trước khi lưu.
      final duplicates = await dupRes.fold(
        (l) async => const <LeadDuplicateInfo>[],
        (r) async => r.duplicates ?? const <LeadDuplicateInfo>[],
      );
      if (duplicates.isNotEmpty) {
        _log.logW('Lead duplicate found - count: ${duplicates.length}');
        emit(state.copyWith(
          submitStatus: BaseStateStatus.idle,
          duplicates: duplicates,
        ));
        return;
      }
    }

    // Bước 3: lưu phiếu lead.
    final saveRes = await _repo.saveData(payload: payload);

    await saveRes.fold(
      (l) async {
        _log.logE('Save lead failed: $l');
        emit(state.copyWith(
          submitStatus: BaseStateStatus.failed,
          submitMessage: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('Save lead success - id: ${r.id}, code: ${r.leadCode}');
        emit(state.copyWith(
          submitStatus: BaseStateStatus.success,
          submitMessage: r.message ?? 'Thêm lead thành công!',
          saveResult: r,
          duplicates: const [],
        ));
      },
    );
  }

  /// Người dùng huỷ lưu phiếu lead bị trùng — quay lại màn form.
  void _onCancelDuplicateSave(Emitter<LeadMarketingState> emit) {
    emit(state.copyWith(
      submitStatus: BaseStateStatus.init,
      submitMessage: null,
      saveResult: null,
      duplicates: const [],
    ));
  }

  /// Xóa trạng thái kết quả lưu phiếu lead.
  ///
  /// Được gọi sau khi UI đã xử lý kết quả (hiển thị thông báo) để lần mở
  /// màn sau không bị lặp lại thông báo cũ.
  void _onClearSubmitState(Emitter<LeadMarketingState> emit) {
    emit(state.copyWith(
      submitStatus: BaseStateStatus.init,
      submitMessage: null,
      saveResult: null,
      duplicates: const [],
    ));
  }

  /// Xoá phiếu lead.
  ///
  /// Gọi `POST /Lead/delete` với mảng ID. Chỉ coi là thành công khi API
  /// trả `message` và `data` có chứa ID đã xoá.
  Future<void> _onDeleteLead(
    Emitter<LeadMarketingState> emit, {
    required int id,
  }) async {
    emit(state.copyWith(
      deleteStatus: BaseStateStatus.loading,
      deleteMessage: null,
    ));

    final res = await _repo.deleteLeads(ids: [id]);

    await res.fold(
      (l) async {
        _log.logE('Delete lead failed: $l');
        emit(state.copyWith(
          deleteStatus: BaseStateStatus.failed,
          deleteMessage: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('Delete lead success - ids: $r');
        emit(state.copyWith(
          deleteStatus: BaseStateStatus.success,
          deleteMessage: 'Xóa lead thành công!',
        ));
      },
    );
  }

  /// Xóa trạng thái kết quả xoá phiếu lead.
  void _onClearDeleteState(Emitter<LeadMarketingState> emit) {
    emit(state.copyWith(
      deleteStatus: BaseStateStatus.init,
      deleteMessage: null,
    ));
  }

  /// Gọi API lấy danh sách phiếu lead theo khoảng thời gian đang lọc.
  Future<void> _loadLeads(
    Emitter<LeadMarketingState> emit, {
    required DateTime dateStart,
    required DateTime dateEnd,
  }) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
      dateStart: dateStart,
      dateEnd: dateEnd,
    ));

    final res = await _repo.getLeadData(
      viewMode: state.viewMode,
      dateStart: dateStart,
      dateEnd: dateEnd,
      leadType: state.leadType,
      leadSourceId: state.leadSourceId,
      marketingEmployeeId: state.marketingEmployeeId,
      saleEmployeeId: state.saleEmployeeId,
      includeOpen: state.includeOpen,
    );

    await res.fold(
      (l) async {
        _log.logE('Get lead data failed: $l');
        emit(state.copyWith(
          status: BaseStateStatus.failed,
          message: l.getErrorMessage,
        ));
      },
      (r) async {
        _log.logI('Get lead data success - total: ${r.length}');
        emit(state.copyWith(
          status: BaseStateStatus.success,
          leads: r,
        ));
      },
    );
  }
}
