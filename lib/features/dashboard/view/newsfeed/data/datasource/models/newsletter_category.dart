/// Nhóm tin của bảng tin (tab lọc tin nổi bật).
///
/// API `/newsletter/get-limit-newsletter` trả về `NewsletterTypeCode` để định
/// danh nhóm tin:
///
/// - `t1` → Hành chính Nhân sự (HCNS), tên hiển thị API: "Tin HCNS".
/// - `MKT` → Marketing, tên hiển thị API: "Tin MKT".
enum NewsletterCategory {
  /// Tin Hành chính Nhân sự. `NewsletterTypeCode` = `t1`.
  hcns,

  /// Tin Marketing. `NewsletterTypeCode` = `MKT`.
  mkt;

  /// Mã loại tin do API quy định.
  String get code => switch (this) {
    NewsletterCategory.hcns => 't1',
    NewsletterCategory.mkt => 'MKT',
  };

  /// Tên hiển thị trên tab.
  String get label => switch (this) {
    NewsletterCategory.hcns => 'HCNS',
    NewsletterCategory.mkt => 'MKT',
  };

  /// Tên đầy đủ, dùng cho tiêu đề nhóm tin.
  String get fullLabel => switch (this) {
    NewsletterCategory.hcns => 'Hành chính Nhân sự',
    NewsletterCategory.mkt => 'Marketing',
  };

  /// Biểu tượng đại diện cho nhóm tin.
  String get emoji => switch (this) {
    NewsletterCategory.hcns => '👥',
    NewsletterCategory.mkt => '📣',
  };
}
