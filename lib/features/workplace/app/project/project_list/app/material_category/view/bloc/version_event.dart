part of 'version_bloc.dart';

@freezed
class VersionEvent with _$VersionEvent {
  /// Khởi tạo dữ liệu cho tab Phiên bản theo `projectSolutionId` (lấy từ SolutionModel).
  const factory VersionEvent.init({int? projectSolutionId}) = _Init;

  /// Tải lại dữ liệu với cùng `projectSolutionId` đã dùng trước đó.
  const factory VersionEvent.refresh() = _Refresh;
}
