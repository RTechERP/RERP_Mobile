import 'data/datasource/models/stationery_model.dart';

class StationeryEditRouteArgs {
  final StationeryItem item;
  final List<StationeryDetailItem> details;

  const StationeryEditRouteArgs({
    required this.item,
    required this.details,
  });
}
