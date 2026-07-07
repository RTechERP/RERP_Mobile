part of 'general_form_bloc.dart';

@CopyWith()
class GeneralFormState extends BaseBlocState {
  final List<FormItem> formItems;
  final List<DepartResponse> departments;
  final int? selectedDepartmentId;
  final String searchKeyword;

  // Detail state
  final List<FormDetailItem> detailFiles;
  final bool isDetailLoading;

  // Download state
  final bool isDownloading;
  final String? downloadMessage;

  const GeneralFormState({
    required super.status,
    super.message,
    this.formItems = const [],
    this.departments = const [],
    this.selectedDepartmentId,
    this.searchKeyword = '',
    this.detailFiles = const [],
    this.isDetailLoading = false,
    this.isDownloading = false,
    this.downloadMessage,
  });

  factory GeneralFormState.init() => const GeneralFormState(
        status: BaseStateStatus.init,
        formItems: [],
        departments: [],
        selectedDepartmentId: null,
        searchKeyword: '',
        detailFiles: [],
        isDetailLoading: false,
        isDownloading: false,
        downloadMessage: null,
      );

  List<FormItem> get filteredItems {
    if (searchKeyword.isEmpty) return formItems;
    final keywordLower = searchKeyword.toLowerCase();
    return formItems.where((item) {
      final nameMatch = item.nameDocument?.toLowerCase().contains(keywordLower) ?? false;
      final codeMatch = item.code?.toLowerCase().contains(keywordLower) ?? false;
      final typeMatch = item.nameDocumentType?.toLowerCase().contains(keywordLower) ?? false;
      return nameMatch || codeMatch || typeMatch;
    }).toList();
  }

  /// Groups form items by departmentId
  Map<String, List<FormItem>> get groupedItems {
    final Map<String, List<FormItem>> grouped = {};
    for (final item in filteredItems) {
      final deptId = item.departmentId?.toString() ?? 'unknown';
      final deptName = item.departmentName ?? 'Không xác định';
      final key = '$deptId|$deptName';
      grouped.putIfAbsent(key, () => []).add(item);
    }
    return grouped;
  }

  /// Returns sorted group entries (sorted by departmentId)
  List<MapEntry<String, List<FormItem>>> get sortedGroupedItems {
    final entries = groupedItems.entries.toList();
    entries.sort((a, b) {
      final aId = int.tryParse(a.key.split('|').first) ?? 0;
      final bId = int.tryParse(b.key.split('|').first) ?? 0;
      return aId.compareTo(bId);
    });
    return entries;
  }

  @override
  List get props => [
        status,
        message,
        formItems,
        departments,
        selectedDepartmentId,
        searchKeyword,
        detailFiles,
        isDetailLoading,
        isDownloading,
        downloadMessage,
      ];
}
