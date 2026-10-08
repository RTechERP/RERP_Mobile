import 'package:easy_localization/easy_localization.dart';
import '../../../../../routes/route_names.dart';

enum WarehouseType {
  sale,
  demo,
  agv,
  project,
  test,
}

extension WarehouseTypeExtension on WarehouseType {
  String get routeName {
    switch (this) {
      case WarehouseType.sale:
        return RouteNames.warehouseSale;
      case WarehouseType.demo:
        return RouteNames.warehouseDemo;
      case WarehouseType.agv:
        return RouteNames.warehouseAgv;
      case WarehouseType.project:
        return RouteNames.warehouseProject;
      case WarehouseType.test:
        return RouteNames.warehouseTest;
    }
  }

  String get areaRouteName {
    switch (this) {
      case WarehouseType.sale:
        return RouteNames.warehouseSaleArea;
      case WarehouseType.demo:
        return RouteNames.warehouseDemoArea;
      case WarehouseType.agv:
        return RouteNames.warehouseAgvArea;
      case WarehouseType.project:
        return RouteNames.warehouseProjectArea;
      case WarehouseType.test:
        return RouteNames.warehouseTestArea;
    }
  }

  String get areaDetailRouteName {
    switch (this) {
      case WarehouseType.sale:
        return '${RouteNames.warehouseSaleArea}/detail';
      case WarehouseType.demo:
        return '${RouteNames.warehouseDemoArea}/detail';
      case WarehouseType.agv:
        return '${RouteNames.warehouseAgvArea}/detail';
      case WarehouseType.project:
        return '${RouteNames.warehouseProjectArea}/detail';
      case WarehouseType.test:
        return '${RouteNames.warehouseTestArea}/detail';
    }
  }

  String get titleKey {
    switch (this) {
      case WarehouseType.sale:
        return 'warehouse.sale'.tr();
      case WarehouseType.demo:
        return 'warehouse.demo'.tr();
      case WarehouseType.agv:
        return 'warehouse.agv'.tr();
      case WarehouseType.project:
        return 'warehouse.project'.tr();
      case WarehouseType.test:
        return 'warehouse.test'.tr();
    }
  }
}
