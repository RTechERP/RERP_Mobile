// Date: 11/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Định nghĩa route path constants cho toàn app

class RouteNames {
  // Splash
  static const splash = '/';

  // Auth
  static const login = '/login';

  // Dashboard
  static const dashboard = '/dashboard';

  // Applications
  static const attendance = '/attendance';
  static const workspace = '';
  static const generalforms = '/general_forms';
  static const summarywork = '/summary_work';
  static const regwork = '/regwork';
  static const reggeneral = '/reg_general';
  static const report = '/report';
  static const weekplan = '/week_plan';
  static const weekplanMenu = '/week_plan/menu';
  static const weekplanMyTask = '/week_plan/my_task';
  static const weekplanRelated = '/week_plan/related';
  static const weekplanAssigned = '/week_plan/assigned';
  static const weekplanAll = '/week_plan/all';
  static const weekplanAdd = '/week_plan/add';
  static const weekplanDetail = '/week_plan/detail';
  static const weekplanDashboard = '/week_plan/dashboard';
  static const weekplanTimeline = '/week_plan/timeline';
  static const stock = '/stock';
  static const warehouse = '/warehouse';

  static const regworkLunch = '/regwork/lunch';

  static const regworkLunchDetail = '/regwork/lunch/detail';
  static const regworkLunchAdd = '/regwork/lunch/add';

  static const regworkLeave = '/regwork/leave';

  static const regworkLeaveDetail = '/regwork/leave/detail';

  static const regworkLeaveAdd = '/regwork/leave/add';

  static const regworkInOut = '/regwork/in_out';

  static const regworkInOutDetail = '/regwork/in_out/detail';

  static const regworkInOutAdd = '/regwork/in_out/add';

  static const regworkOvertime = '/regwork/overtime';

  static const regworkOvertimeDetail = '/regwork/overtime/detail';

  static const regworkOvertimeAdd = '/regwork/overtime/add';

  static const regworkWfh = '/regwork/wfh';

  static const regworkWfhDetail = '/regwork/wfh/detail';
  static const regworkWfhAdd = '/regwork/wfh/add';

  static const regworkMissed = '/regwork/missed';

  static const regworkMissedDetail = '/regwork/missed/detail';

  static const regworkMissedAdd = '/regwork/missed/add';

  static const regworkOvernight = '/regwork/overnight';

  static const regworkOvernightDetail = '/regwork/overnight/detail';

  static const regworkOvernightAdd = '/regwork/overnight/add';

  // Reg Work - Personal Summary
  static const regworkPersonalSummary = '/regwork/sum-personal';

  // Reports

  ///*** Techinical Department ***///
  static const reportITdepart = '/report/tech';
  static const reportITdepartDetail = '/report/tech/detail';
  static const reportITdepartAdd = '/report/tech/add';

  static const reportITdepartEdit = '/report/tech/edit';

  ///***Sale Department***///
  static const reportSaledepart = '/report/sale';

  static const reportSaleAdd = '/report/sale/add';

  ///**** Admin Sale ****///
  static const reportSaledAdminDetail = '/report/sale_admin/detail';

  static const reportSaleAdminAdd = '/report/sale_admin/add';

  static const reportSaleAdminEdit = '/report/sale_admin/edit';

  ///**** Sale Staff ****///
  static const reportSaleStaffDetail = '/report/sale_staff/detail';

  static const reportSaleStaffAdd = '/report/sale_staff/add';

  static const reportSaleStaffEdit = '/report/sale_staff/edit';

  ///*** Marketing Department ***///
  static const reportMarketingdepart = '/report/marketing';
  static const reportMarketingdepartDetail = '/report/marketing/detail';
  static const reportMarketingdepartAdd = '/report/marketing/add';
  static const reportMarketingdepartEdit = '/report/marketing/edit';

  ///*** HR Department ***///
  static const reportHRAdd = '/report/hr/add';
  static const reportHREdit = '/report/hr/edit';
  static const reportHRLxcpEdit = '/report/hr/lxcp/edit';

  ///**** Administration - IT ****///

  static const reportHRAdmin = '/report/hr/admin';
  static const reportHRAdminDetail = '/report/hr/admin/detail';

  ///**** LXCP ****///
  static const reportHRLXCP = '/report/hr/lxcp';
  static const reportHRLXCPDetail = '/report/hr/lxcp/detail';

  ///*** AGV - Mechanical Department
  static const reportAGVdepart = '/report/agv';
  static const reportAGVdepartDetail = '/report/agv/detail';
  static const reportAGVdepartAdd = '/report/agv/add';

  static const reportAGVdepartEdit = '/report/agv/edit';

  ///*** Assembly - Deployment Department ***///
  static const reportADdepart = '/report/ad';
  static const reportADdepartDetail = '/report/ad/detail';
  static const reportADdepartAdd = '/report/ad/add';

  static const reportADdepartEdit = '/report/ad/edit';

  ///*** Accountant Department ***///
  static const reportAccountant = '/report/accountant';
  static const reportAccountantDetail = '/report/accountant/detail';
  static const reportAccountantAdd = '/report/accountant/add';
  static const reportAccountantEdit = '/report/accountant/edit';

  // Favorites
  static const favorites = '/favorites';

  // Reg Work - Work Trip
  static const regworkWorkTrip = '/regwork/work_trip';
  static const regworkWorkTripDetail = '/regwork/work_trip/detail';
  static const regworkWorkTripAdd = '/regwork/work_trip/add';

  // Reg General
  static const meetingRoom = '/reg_general/meeting_room';
  static const meetingRoomAdd = '/reg_general/meeting_room/add';

  static const meetingRoomEdit = '/reg_general/meeting_room/edit';

  static const bookingVehicle = '/reg_general/booking_vehicle';

  static const bookingVehicleAdd = '/reg_general/booking_vehicle/add';

  static const bookingVehicleDetail = '/reg_general/booking_vehicle/detail';

  static const bookingVehicleEdit = '/reg_general/booking_vehicle/Edit';

  /// Đặt phòng nhà nghỉ — danh sách phiếu đặt.
  static const bookingGuestHouse = '/reg_general/booking_guest_house';

  /// Đặt phòng nhà nghỉ — thêm mới phiếu đặt.
  static const bookingGuestHouseAdd =
      '/reg_general/booking_guest_house/add';

  /// Đặt phòng nhà nghỉ — chỉnh sửa phiếu đặt.
  static const bookingGuestHouseEdit =
      '/reg_general/booking_guest_house/edit';

  /// Đặt phòng nhà nghỉ — cập nhật TTQT (UI cũ, có file bill/hoá đơn).
  static const bookingGuestHouseSettlement =
      '/reg_general/booking_guest_house/settlement';

  /// Đặt phòng nhà nghỉ — đề nghị tạm ứng (UI mới, 10 field theo yêu cầu).
  static const bookingGuestHouseAdvance =
      '/reg_general/booking_guest_house/advance';

  // Rental Vehicle
  static const rentalVehicle = '/reg_general/rental_vehicle';
  static const rentalVehicleAdd = '/reg_general/rental_vehicle/add';
  static const rentalVehicleUpdate = '/reg_general/rental_vehicle/update';

  static const workCategory = '/reg_general/work_category';

  static const workCategoryAdd = '/reg_general/work_category/add';

  static const workCategoryDetail = '/reg_general/work_category/detail';

  static const personalAsset = '/reg_general/personal_asset';
  static const personalAssetDetail = '/reg_general/personal_asset/detail';
  static const personalPropertyDetail =
      '/reg_general/personal_asset/property/detail';

  static const stationery = '/reg_general/stationery';

  static const stationeryAdd = '/reg_general/stationery/add';
  static const stationeryDetail = '/reg_general/stationery/detail';
  static const stationeryEdit = '/reg_general/stationery/edit';

  // Contract Registration
  static const contractRegistration = '/reg_general/contract_registration';
  static const contractRegistrationAdd =
      '/reg_general/contract_registration/add';
  static const contractRegistrationDetail =
      '/reg_general/contract_registration/detail';

  // Work Requirement
  static const workRequirement = '/reg_general/work_requirement';
  static const workRequirementAdd = '/reg_general/work_requirement/add';
  static const workRequirementDetail = '/reg_general/work_requirement/detail';
  static const workRequirementEdit = '/reg_general/work_requirement/edit';

  // Idea Registration
  static const ideaRegistration = '/reg_general/idea_registration';
  static const ideaRegistrationAdd = '/reg_general/idea_registration/add';
  static const ideaRegistrationEdit = '/reg_general/idea_registration/edit';

  // Stamp Registration
  static const String stamp = '/reg_general/stamp';
  static const String stampAdd = '/reg_general/stamp/add';
  static const String stampDetail = '/reg_general/stamp/detail';

  // Test Table Registration
  static const String testTable = '/reg_general/test_table';
  static const String testTableAdd = '/reg_general/test_table/add';
  static const String testTableEdit = '/reg_general/test_table/edit';
  static const String testTableQrScan = '/reg_general/test_table/qr-scan';
  static const String testTableExtendHandover =
      '/reg_general/test_table/extend-handover';

  // Signature Registration
  static const String signature = '/signature';
  static const String signatureAdd = '/signature/add';

  // More - Settings
  static const notificationSettings = '/more/notification_settings';
  static const avatarViewer = '/more/avatar_viewer';

  // Salary
  static const salaryMenu = '/salary';
  static const salarySummary = '/salary/summary';
  static const salaryFingerprint = '/salary/fingerprint';
  static const salaryAttendance = '/salary/attendance';
  static const salaryPayslip = '/salary/payslip';
  static const salaryForgotPin = '/salary/forgot_pin';
  static const salaryCardDetail = '/salary/card_detail';

  // Poll
  static const poll = '/poll';
  static const pollDetail = '/poll/detail';

  // General Form
  static const generalForms = '/general_forms';
  static const generalFormDetail = '/general_forms/detail';

  // Personal Approve
  static const personalApprove = '/personal_approve';

  /// Menu "Duyệt công" - grid 9 loại phiếu (Đăng ký nghỉ, Làm thêm, ...).
  /// Là lớp menu thứ 2 trong flow Phê duyệt: từ `personalApprove` (menu nhóm)
  /// bấm "Duyệt công" → màn này → bấm 1 loại phiếu → màn TBP duyệt.
  static const personalApproveTimesheetMenu =
      '/personal_approve/approve_timesheet/menu';
  static const personalApproveTimesheet =
      '/personal_approve/approve_timesheet/timesheet';
  static const personalApproveTimesheetDetail =
      '/personal_approve/approve_timesheet/timesheet/detail';
  static const personalApproveSeniorTimesheet =
      '/personal_approve/approve_timesheet/senior_timesheet';
  static const personalApproveSeniorTimesheetDetail =
      '/personal_approve/approve_timesheet/senior_timesheet/detail';

  /// Helper: route duyệt công theo một `tType` cụ thể.
  ///
  /// Dùng cho menu Phê duyệt — mỗi mục con (Đăng ký nghỉ, Làm thêm, ...)
  /// gọi route này với `tType` tương ứng để API `getApproveTimesheet` filter
  /// theo `TType` trong payload.
  static String personalApproveTimesheetByType(int tType) =>
      '$personalApproveTimesheet?tType=$tType';

  /// Màn Duyệt phiếu Đặt phòng nhà nghỉ (TBP).
  /// Hiện tại chỉ hiển thị danh sách + bộ lọc; chưa có action duyệt.
  static const personalApproveBookingGuestHouse =
      '/personal_approve/approve_booking_guest_house';

  /// Menu "Duyệt ĐX/NN" (Đặt xe / Nhà nghỉ) - grid 3 mục: Duyệt file,
  /// Duyệt ĐNTT, Duyệt tạm ứng.
  static const personalApproveBookingGnMenu =
      '/personal_approve/approve_booking_gn/menu';

  // Warehouse
  static const warehouseArea = '/warehouse_area';
  static const warehouseSaleArea = '/warehouse_sale_area';
  static const warehouseDemoArea = '/warehouse_demo_area';
  static const warehouseAgvArea = '/warehouse_agv_area';
  static const warehouseProjectArea = '/warehouse_project_area';
  static const warehouseTestArea = '/warehouse_test_area';
  static const warehouseSale = '/warehouse_sale';
  static const warehouseDemo = '/warehouse_demo';
  static const warehouseAgv = '/warehouse_agv';
  static const warehouseProject = '/warehouse_project';
  static const warehouseTest = '/warehouse_test';
  static const warehouseSaleGdn = '/warehouse_sale_gdn';
  static const warehouseSaleGdnDetail = '/warehouse_sale_gdn/detail';
  static const warehouseSaleHistoryImportExport =
      '/warehouse_sale_history_import_export';

  // Summary Work
  static const summaryWorkLeaving = '/summary-work/leaving';
  static const summaryWorkInOut = '/summary-work/in-out';
  static const summaryWorkWfh = '/summary-work/wfh';
  static const summaryWorkFingerprint = '/summary-work/fingerprint';
  static const summaryWorkOvertime = '/summary-work/overtime';
  static const summaryWorkOvernight = '/summary-work/overnight';

  // Chatbot
  static const chatbot = '/chatbot';

  // Celebration (Birthday / Seniority popup)
  static const celebration = '/celebration';

  // Project
  static const projectMenu = '/project/menu';
  static const projectList = 'list';
  static const materialCategory = 'material-category';

  // CRM - Tổng hợp khách hàng
  /// Menu CRM (lớp menu trung gian): workspace → CRM → Tổng hợp khách hàng.
  static const crmMenu = '/crm';

  /// Màn tổng hợp khách hàng CRM (route con của [crmMenu]).
  static const crmSummaryCustomer = 'summary_customer';

  /// Màn danh sách phiếu lead marketing CRM (route con của [crmMenu]).
  static const crmLeadMarketing = 'lead_marketing';

  /// Màn tạo phiếu lead mới (route con của [crmLeadMarketing]).
  ///
  /// Dùng absolute path để `context.push` không bị lỗi match với route cha.
  static const crmLeadMarketingAdd = '/crm/lead_marketing/add';

  /// Màn chỉnh sửa phiếu lead (route con của [crmLeadMarketing]).
  ///
  /// Dùng absolute path để `context.push` không bị lỗi match với route cha.
  static const crmLeadMarketingEdit = '/crm/lead_marketing/edit';

  /// Màn ghi hoạt động cho phiếu lead (route con của [crmLeadMarketing]).
  ///
  /// Dùng absolute path để `context.push` không bị lỗi match với route cha.
  static const crmLeadActivityAdd = '/crm/lead_marketing/activity/add';
}
