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
  static const stock = '/stock';

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

  static const workCategory = '/reg_general/work_category';

  static const workCategoryAdd = '/reg_general/work_category/add';

  static const workCategoryDetail = '/reg_general/work_category/detail';

  static const personalAsset = '/reg_general/personal_asset';
  static const personalAssetDetail = '/reg_general/personal_asset/detail';
  static const personalPropertyDetail = '/reg_general/personal_asset/property/detail';

  // More - Settings
  static const notificationSettings = '/more/notification_settings';
}
