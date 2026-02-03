import 'package:equatable/equatable.dart';

/// ==========================
/// 🔹 Tech Work (Entity)
/// ==========================

class TechWork extends Equatable {
  final String id;
  final String? category;
  final String totalHours;
  final String otHours;
  final String percent;
  final String content;
  final String result;
  final DateTime? date; // 👈 nullable

  const TechWork({
    required this.id,
    this.category,
    this.totalHours = '',
    this.otHours = '',
    this.percent = '',
    this.content = '',
    this.result = '',
    this.date, // 👈 nullable
  });

  factory TechWork.fromJson(Map<String, dynamic> json) {
    return TechWork(
      id: json['id'] as String,
      category: json['category'] as String?,
      totalHours: json['total_hours'] as String? ?? '',
      otHours: json['ot_hours'] as String? ?? '',
      percent: json['percent'] as String? ?? '',
      content: json['content'] as String? ?? '',
      result: json['result'] as String? ?? '',
      date: json['date'] != null
          ? DateTime.tryParse(json['date'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'total_hours': totalHours,
      'ot_hours': otHours,
      'percent': percent,
      'content': content,
      'result': result,
      if (date != null) 'date': date!.toIso8601String(), // 👈 chỉ gửi khi có
    };
  }

  TechWork copyWith({
    String? category,
    String? totalHours,
    String? otHours,
    String? percent,
    String? content,
    String? result,
    DateTime? date,
    bool clearDate = false, // 👈 tiện cho case xoá date
  }) {
    return TechWork(
      id: id,
      category: category ?? this.category,
      totalHours: totalHours ?? this.totalHours,
      otHours: otHours ?? this.otHours,
      percent: percent ?? this.percent,
      content: content ?? this.content,
      result: result ?? this.result,
      date: clearDate ? null : (date ?? this.date),
    );
  }

  @override
  List<Object?> get props =>
      [id, category, totalHours, otHours, percent, content, result, date];
}

/// ==========================
/// 🔹 Tech Category
/// ==========================
class TechCategory extends Equatable {
  final String? category;
  final List<TechWork> works;

  const TechCategory({
    this.category,
    this.works = const [],
  });

  factory TechCategory.fromJson(Map<String, dynamic> json) {
    return TechCategory(
      category: json['category'] as String?,
      works: (json['works'] as List<dynamic>? ?? [])
          .map((e) => TechWork.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'works': works.map((e) => e.toJson()).toList(),
    };
  }

  TechCategory copyWith({
    String? category,
    List<TechWork>? works,
  }) {
    return TechCategory(
      category: category ?? this.category,
      works: works ?? this.works,
    );
  }

  @override
  List<Object?> get props => [category, works];
}

/// ==========================
/// 🔹 Tech Project
/// ==========================
class TechProject extends Equatable {
  final String id;
  final String? name;
  final List<TechCategory> categories;

  final List<TechWork> works;

  const TechProject({
    required this.id,
    this.name,
    this.categories = const [],
    this.works = const [],
  });

  factory TechProject.fromJson(Map<String, dynamic> json) {
    return TechProject(
      id: json['id'] as String,
      name: json['name'] as String?,
      categories: (json['categories'] as List<dynamic>? ?? [])
          .map((e) => TechCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      works: (json['works'] as List<dynamic>? ?? [])
          .map((e) => TechWork.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categories': categories.map((e) => e.toJson()).toList(),
      'works': works.map((e) => e.toJson()).toList(),
    };
  }

  TechProject copyWith({
    String? id,
    String? name,
    List<TechCategory>? categories,
    List<TechWork>? works,
  }) {
    return TechProject(
      id: id ?? this.id,
      name: name ?? this.name,
      categories: categories ?? this.categories,
      works: works ?? this.works,
    );
  }

  @override
  List<Object?> get props => [id, name, categories, works];
}

/// ==========================
/// 🔹 Tech Report Payload
/// ==========================
class TechReportPayload extends Equatable {
  final String? userId;
  final String? date;
  final List<TechCategory> categories;

  const TechReportPayload({
    this.userId,
    this.date,
    this.categories = const [],
  });

  factory TechReportPayload.fromJson(Map<String, dynamic> json) {
    return TechReportPayload(
      userId: json['userId'] as String?,
      date: json['date'] as String?,
      categories: (json['categories'] as List<dynamic>? ?? [])
          .map((e) => TechCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'date': date,
      'categories': categories.map((e) => e.toJson()).toList(),
    };
  }

  TechReportPayload copyWith({
    String? userId,
    String? date,
    List<TechCategory>? categories,
  }) {
    return TechReportPayload(
      userId: userId ?? this.userId,
      date: date ?? this.date,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [userId, date, categories];
}