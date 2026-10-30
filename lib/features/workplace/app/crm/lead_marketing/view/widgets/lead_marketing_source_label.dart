import '../../data/datasource/models/lead_marketing_model.dart';

/// Nhãn hiển thị của nguồn lead.
///
/// `SourceGroup = 1` là nguồn thuộc Marketing → thêm `(MKT)`,
/// `SourceGroup = 2` là nguồn thuộc Sales → thêm `(Sales)`.
String leadSourceLabel(LeadSource source) {
  final name = (source.name ?? '').trim();
  final base = name.isEmpty ? 'Nguồn ${source.id}' : name;
  switch (source.sourceGroup) {
    case 1:
      return '$base (MKT)';
    case 2:
      return '$base (Sales)';
    default:
      return base;
  }
}
