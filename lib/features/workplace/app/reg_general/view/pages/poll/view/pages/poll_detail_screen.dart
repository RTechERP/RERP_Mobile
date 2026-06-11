import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/poll_model.dart';
import '../bloc/poll_bloc.dart';
import '../widgets/poll_detail_widgets.dart';

class PollDetailScreen extends StatefulWidget {
  const PollDetailScreen({super.key, required this.item});

  final PollItem item;

  @override
  State<PollDetailScreen> createState() => _PollDetailScreenState();
}

class _PollDetailScreenState
    extends BaseState<PollDetailScreen, PollEvent, PollState, PollBloc> {
  Map<String, String?> _liveFieldValueMap = const {};
  int? _selectedSectionId;
  bool _hasAttemptedConfirm = false;
  final Map<int, GlobalKey> _questionKeys = {};
  final Set<String> _dirtyFields = {};
  final Set<String> _clearedFields = {};

  @override
  void initState() {
    super.initState();
    bloc.add(PollEvent.initDetail(widget.item));
  }

  void _onAnswerChanged(String fieldKey, String? value) {
    final normalizedKey = fieldKey.trim();
    if (normalizedKey.isEmpty) return;

    final normalizedValue = value?.trim();
    final nextValue = normalizedValue == null || normalizedValue.isEmpty
        ? null
        : normalizedValue;

    if (nextValue == null) {
      // Chỉ xóa nếu field đã bị dirty (user từng thay đổi)
      if (_dirtyFields.contains(normalizedKey)) {
        _clearedFields.add(normalizedKey);
        setState(() {
          _liveFieldValueMap = Map.from(_liveFieldValueMap)..remove(normalizedKey);
        });
      }
    } else {
      _dirtyFields.add(normalizedKey);
      _clearedFields.remove(normalizedKey);
      final currentValue = _liveFieldValueMap[normalizedKey];
      if (currentValue != nextValue) {
        setState(() {
          _liveFieldValueMap = {
            ..._liveFieldValueMap,
            normalizedKey: nextValue,
          };
        });
      }
    }
  }

  void _onSectionSelected(int? sectionId) {
    if (_selectedSectionId == sectionId) return;
    setState(() => _selectedSectionId = sectionId);
  }

  GlobalKey _questionKeyFor(int? questionId) {
    if (questionId == null) {
      return GlobalKey();
    }
    return _questionKeys.putIfAbsent(questionId, GlobalKey.new);
  }

  Future<void> _scrollToQuestion(int? questionId) async {
    if (questionId == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final targetContext = _questionKeys[questionId]?.currentContext;
      if (targetContext == null || !mounted) return;

      await Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeInOut,
        alignment: 0.12,
      );
    });
  }

  void _onConfirm(
    _RequiredValidationState validation,
    List<_SurveySectionData> visibleSections,
  ) {
    final firstInvalidSectionId = validation.firstInvalidSectionId;
    final firstInvalidQuestionId = validation.firstInvalidQuestionId;

    setState(() {
      _hasAttemptedConfirm = true;
      if (firstInvalidSectionId != null &&
          visibleSections.any((section) => section.id == firstInvalidSectionId)) {
        _selectedSectionId = firstInvalidSectionId;
      }
    });

    if (validation.hasMissingRequiredAnswers) {
      _scrollToQuestion(firstInvalidQuestionId);
      return;
    }
  }

  int? _resolveSelectedSectionId(List<_SurveySectionData> sections) {
    if (sections.isEmpty) return null;

    final hasSelectedSection = sections.any((section) => section.id == _selectedSectionId);
    if (hasSelectedSection) return _selectedSectionId;

    return sections.first.id;
  }

  bool _hasTriggeredDependentSection(PollDetailItem detail) {
    final allSections = detail.sections ?? const <PollSectionItem>[];
    if (allSections.isEmpty) return false;

    final fieldValueMap = {
      ...PollDetailHelpers.buildFieldValueMap(detail),
      ..._liveFieldValueMap,
    };

    return allSections.any((section) {
      final questions = section.questions ?? const <PollQuestionItem>[];
      if (questions.isEmpty) return false;
      return PollDetailHelpers.evaluateShowIf(section.showIfJson, fieldValueMap);
    });
  }

  _RequiredValidationState _buildRequiredValidationState(
    List<_SurveySectionData> sections, {
    Map<String, String?> liveFieldValueMap = const {},
  }) {
    final missingTitles = <String>[];
    final invalidQuestionIds = <int>{};
    int? firstInvalidSectionId;
    int? firstInvalidQuestionId;

    for (final section in sections) {
      for (final question in section.questions) {
        if (question.isRequired != true) continue;
        if (_hasQuestionValue(question, liveFieldValueMap: liveFieldValueMap)) {
          continue;
        }
        final questionId = question.id;
        if (questionId != null) {
          invalidQuestionIds.add(questionId);
        }
        firstInvalidSectionId ??= section.id;
        firstInvalidQuestionId ??= questionId;
        missingTitles.add(_questionLabel(question, missingTitles.length + 1));
      }
    }

    return _RequiredValidationState(
      missingQuestionTitles: missingTitles,
      invalidQuestionIds: invalidQuestionIds,
      firstInvalidSectionId: firstInvalidSectionId,
      firstInvalidQuestionId: firstInvalidQuestionId,
    );
  }

  bool _hasQuestionValue(
    PollQuestionItem question, {
    Map<String, String?> liveFieldValueMap = const {},
  }) {
    final fieldKey = question.fieldKey?.trim();
    if (fieldKey != null && fieldKey.isNotEmpty && liveFieldValueMap.containsKey(fieldKey)) {
      final liveValue = liveFieldValueMap[fieldKey]?.trim();
      return liveValue != null && liveValue.isNotEmpty;
    }

    final values = PollDetailHelpers.extractDisplayValues(question);
    return values.any(
      (value) =>
          value.trim().isNotEmpty &&
          value != 'Chưa có dữ liệu trả lời' &&
          value != 'Chưa chọn đáp án',
    );
  }

  String _questionLabel(PollQuestionItem question, int fallbackIndex) {
    final text = question.questionText?.trim();
    if (text != null && text.isNotEmpty) {
      return text;
    }
    return 'Câu hỏi $fallbackIndex';
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BaseScaffold(
          backgroundColor: const Color(0xFFF4F7FB),
          appBar: const AppBarCommon(title: Text('Chi tiết bình chọn')),
          body: BlocBuilder<PollBloc, PollState>(
            buildWhen: (prev, curr) =>
                prev.isDetailLoading != curr.isDetailLoading ||
                prev.detailData != curr.detailData ||
                prev.responseData != curr.responseData ||
                prev.detailMessage != curr.detailMessage ||
                prev.questionReadonlyMap != curr.questionReadonlyMap,
            builder: (context, state) {
              if (state.isDetailLoading && state.detailData == null) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.detailMessage?.trim().isNotEmpty == true &&
                  state.detailData == null) {
                return PollDetailStateView(
                  title: state.detailMessage!,
                  actionLabel: 'Tải lại',
                  onTap: () => bloc.add(const PollEvent.refreshDetail()),
                );
              }

              final detail = state.detailData;
              if (detail == null) {
                return PollDetailStateView(
                  title: 'Không có dữ liệu chi tiết bình chọn',
                  actionLabel: 'Tải lại',
                  onTap: () => bloc.add(const PollEvent.refreshDetail()),
                );
              }

              final response = state.responseData;
              final backgroundImageUrl = _buildBackgroundImageUrl(
                detail.backgroundImagePath ?? widget.item.backgroundImagePath,
              );
              final accentColor = _parseColor(
                detail.titleColor ?? widget.item.titleColor,
              );
              final surveySections = _buildSurveySections(
                detail,
                liveFieldValueMap: _liveFieldValueMap,
              );
              final requiredValidation = _buildRequiredValidationState(
                surveySections,
                liveFieldValueMap: _liveFieldValueMap,
              );
              final hasTriggeredDependentSection = _hasTriggeredDependentSection(detail);
              final rootSection = surveySections.where((section) => section.id == null).firstOrNull;
              final visibleSections = surveySections.where((section) => section.id != null).toList();
              final selectedSectionId = _resolveSelectedSectionId(visibleSections);
              final selectedSection = selectedSectionId == null
                  ? visibleSections.firstOrNull
                  : visibleSections.firstWhere(
                      (section) => section.id == selectedSectionId,
                      orElse: () => visibleSections.first,
                    );

              return Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      color: AppColors.primaryERP,
                      onRefresh: () async {
                        bloc.add(const PollEvent.refreshDetail());
                        await bloc.stream.firstWhere((s) => !s.isDetailLoading);
                      },
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                        children: [
                          PollDetailHeroCard(
                            title: PollDetailHelpers.displayText(
                              detail.title,
                              widget.item.title,
                              '--',
                            ),
                            description: PollDetailHelpers.displayText(
                              detail.description,
                              widget.item.description,
                              '--',
                            ),
                            startDateText: _formatDetailDateTime(
                              response?.startDate ?? detail.startDate ?? widget.item.startDate,
                            ),
                            endDateText: _formatDetailDateTime(
                              response?.endDate ?? detail.endDate ?? widget.item.endDate,
                            ),
                            backgroundImageUrl: backgroundImageUrl,
                            accentColor: accentColor,
                            titleColorValue: detail.titleColor ?? widget.item.titleColor,
                            status: _buildPollStatus(
                              response,
                              hasMissingRequiredAnswers:
                                  requiredValidation.hasMissingRequiredAnswers,
                            ),
                          ),
                          if (response?.isClosed == true &&
                              (response?.closedReason?.trim().isNotEmpty == true)) ...[
                            const SizedBox(height: 12),
                            PollClosedReasonCard(reason: response!.closedReason!.trim()),
                          ],
                          if (rootSection != null) ...[
                            const SizedBox(height: 16),
                            PollDetailSectionCard(
                              key: const ValueKey('poll-root-section'),
                              title: rootSection.title,
                              description: rootSection.description,
                              questions: rootSection.questions,
                              backgroundImageUrl: backgroundImageUrl,
                              accentColor: accentColor,
                              questionReadonlyMap: state.questionReadonlyMap,
                              liveFieldValueMap: _liveFieldValueMap,
                              dirtyFields: _dirtyFields,
                              clearedFields: _clearedFields,
                              questionKeyBuilder: _questionKeyFor,
                              invalidQuestionIds: requiredValidation.invalidQuestionIds,
                              showValidationErrors: _hasAttemptedConfirm,
                              onAnswerChanged: _onAnswerChanged,
                            ),
                          ],
                          if (hasTriggeredDependentSection && visibleSections.isNotEmpty && selectedSection != null) ...[
                            const SizedBox(height: 16),
                            _SectionTabsRow(
                              sections: visibleSections,
                              selectedSectionId: selectedSectionId,
                              accentColor: accentColor,
                              onSectionSelected: _onSectionSelected,
                            ),
                            const SizedBox(height: 16),
                            PollDetailSectionCard(
                              key: ValueKey('poll-section-${selectedSection.id}'),
                              title: selectedSection.title,
                              description: selectedSection.description,
                              questions: selectedSection.questions,
                              backgroundImageUrl: backgroundImageUrl,
                              accentColor: accentColor,
                              questionReadonlyMap: state.questionReadonlyMap,
                              liveFieldValueMap: _liveFieldValueMap,
                              dirtyFields: _dirtyFields,
                              clearedFields: _clearedFields,
                              questionKeyBuilder: _questionKeyFor,
                              invalidQuestionIds: requiredValidation.invalidQuestionIds,
                              showValidationErrors: _hasAttemptedConfirm,
                              onAnswerChanged: _onAnswerChanged,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: response?.isClosed == true
                              ? null
                              : () => _onConfirm(requiredValidation, visibleSections),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryERP,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: const Color(0xFFDDE5F0),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Xác nhận',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        BlocBuilder<PollBloc, PollState>(
          buildWhen: (prev, curr) =>
              prev.isDetailLoading != curr.isDetailLoading ||
              prev.detailData != curr.detailData,
          builder: (context, state) {
            if (!state.isDetailLoading || state.detailData == null) {
              return const SizedBox.shrink();
            }

            return Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  alignment: Alignment.center,
                  child: const SizedBox.shrink(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  List<_SurveySectionData> _buildSurveySections(
    PollDetailItem detail, {
    Map<String, String?> liveFieldValueMap = const {},
  }) {
    final baseFieldValueMap = PollDetailHelpers.buildFieldValueMap(detail);
    final mergedFieldValueMap = {...baseFieldValueMap, ...liveFieldValueMap};
    final sections = (detail.sections ?? const <PollSectionItem>[])
        .where(
          (section) =>
              (section.questions ?? const []).isNotEmpty &&
              PollDetailHelpers.evaluateShowIf(section.showIfJson, mergedFieldValueMap),
        )
        .toList()
      ..sort((a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0));
    final rootQuestions = (detail.questions ?? const <PollQuestionItem>[]).toList()
      ..sort((a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0));

    final hasStandaloneQuestions =
        rootQuestions.where((question) => question.sectionId == null).isNotEmpty;

    return [
      if (hasStandaloneQuestions)
        _SurveySectionData(
          id: null,
          title: null,
          description: null,
          questions: rootQuestions
              .where((question) => question.sectionId == null)
              .toList(),
        ),
      ...sections.map(
        (section) => _SurveySectionData(
          id: section.id,
          title: PollDetailHelpers.normalizedOrNull(section.title),
          description: PollDetailHelpers.normalizedOrNull(section.description),
          questions: (section.questions ?? const <PollQuestionItem>[]).toList()
            ..sort(
              (a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0),
            ),
        ),
      ),
    ];
  }

  String? _buildBackgroundImageUrl(String? rawPath) {
    final path = rawPath?.trim();
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return path;
    }

    const baseUrl = 'https://erp.rtc.edu.vn/api/api';
    var normalizedBaseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    if (normalizedBaseUrl.endsWith('/api')) {
      normalizedBaseUrl = normalizedBaseUrl.substring(
        0,
        normalizedBaseUrl.length - 4,
      );
    }

    final normalizedPath = path.startsWith('/') ? path : '/$path';
    return '$normalizedBaseUrl$normalizedPath';
  }

  Color _parseColor(String? rawColor) {
    final value = rawColor?.trim();
    if (value == null || value.isEmpty) return AppColors.secondaryERP;

    var hex = value.replaceFirst('#', '').trim();
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return AppColors.secondaryERP;

    final parsed = int.tryParse(hex, radix: 16);
    if (parsed == null) return AppColors.secondaryERP;
    return Color(parsed);
  }

  String _formatDetailDateTime(DateTime? value) {
    if (value == null) return '--';
    return DateFormat('dd/MM/yyyy HH:mm').format(value);
  }

  PollStatusData _buildPollStatus(
    ResponseItem? response, {
    required bool hasMissingRequiredAnswers,
  }) {
    if (response?.isClosed == true) {
      return const PollStatusData(
        label: 'Bình chọn đã đóng',
        caption: 'TRẠNG THÁI',
        highlight: 'Không thể chỉnh sửa',
        icon: Icons.lock_outline_rounded,
        backgroundColor: Color(0xFFFFF1F2),
        borderColor: Color(0xFFFECDD3),
        iconColor: Color(0xFFE11D48),
        textColor: Color(0xFF9F1239),
      );
    }

    if (hasMissingRequiredAnswers) {
      return const PollStatusData(
        label: 'Thiếu câu trả lời bắt buộc',
        caption: 'TRẠNG THÁI',
        highlight: 'Cần hoàn tất trước khi gửi',
        icon: Icons.error_outline_rounded,
        backgroundColor: Color(0xFFFFF7ED),
        borderColor: Color(0xFFFED7AA),
        iconColor: Color(0xFFEA580C),
        textColor: Color(0xFF9A3412),
      );
    }

    if (response?.hasResponse == true && response?.isCompleted == true) {
      return PollStatusData(
        label: 'Đã hoàn thành',
        caption: 'TRẠNG THÁI',
        highlight: response?.canEdit == true ? 'Bạn vẫn có thể chỉnh sửa' : 'Đã khóa chỉnh sửa',
        icon: Icons.task_alt_rounded,
        backgroundColor: const Color(0xFFECFDF3),
        borderColor: const Color(0xFFA7F3D0),
        iconColor: const Color(0xFF059669),
        textColor: const Color(0xFF065F46),
      );
    }

    if (response?.hasResponse == true) {
      return PollStatusData(
        label: 'Đã gửi phản hồi',
        caption: 'TRẠNG THÁI',
        highlight: response?.canEdit == true ? 'Có thể cập nhật thêm' : 'Đã lưu phản hồi',
        icon: Icons.edit_note_rounded,
        backgroundColor: const Color(0xFFFFF7ED),
        borderColor: const Color(0xFFFED7AA),
        iconColor: const Color(0xFFEA580C),
        textColor: const Color(0xFF9A3412),
      );
    }

    return const PollStatusData(
      label: 'Đang nhận bình chọn',
      caption: 'TRẠNG THÁI',
      highlight: 'Bạn có thể tham gia ngay',
      icon: Icons.how_to_vote_rounded,
      backgroundColor: Color(0xFFEFF6FF),
      borderColor: Color(0xFFBFDBFE),
      iconColor: Color(0xFF2563EB),
      textColor: Color(0xFF1D4ED8),
    );
  }
}

class _RequiredValidationState {
  const _RequiredValidationState({
    required this.missingQuestionTitles,
    required this.invalidQuestionIds,
    required this.firstInvalidSectionId,
    required this.firstInvalidQuestionId,
  });

  final List<String> missingQuestionTitles;
  final Set<int> invalidQuestionIds;
  final int? firstInvalidSectionId;
  final int? firstInvalidQuestionId;

  bool get hasMissingRequiredAnswers => missingQuestionTitles.isNotEmpty;
}

class _SurveySectionData {
  const _SurveySectionData({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
  });

  final int? id;
  final String? title;
  final String? description;
  final List<PollQuestionItem> questions;
}

class _SectionTabsRow extends StatelessWidget {
  const _SectionTabsRow({
    required this.sections,
    required this.selectedSectionId,
    required this.accentColor,
    required this.onSectionSelected,
  });

  final List<_SurveySectionData> sections;
  final int? selectedSectionId;
  final Color accentColor;
  final ValueChanged<int?> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    if (sections.length == 1) {
      final section = sections.first;
      final isSelected = section.id == selectedSectionId;
      final label = section.title?.trim().isNotEmpty == true
          ? section.title!
          : 'Section 1';

      return SizedBox(
        width: double.infinity,
        child: InkWell(
          onTap: () => onSectionSelected(section.id),
          borderRadius: BorderRadius.circular(999),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? accentColor : Colors.white,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: isSelected
                    ? accentColor
                    : AppColors.secondaryERP.withValues(alpha: 0.18),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondaryERP.withValues(alpha: isSelected ? 0.16 : 0.05),
                  blurRadius: isSelected ? 16 : 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : AppColors.heading,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: sections.asMap().entries.map((entry) {
          final section = entry.value;
          final isSelected = section.id == selectedSectionId;
          final label = section.title?.trim().isNotEmpty == true
              ? section.title!
              : 'Section ${entry.key + 1}';

          return Padding(
            padding: EdgeInsets.only(right: entry.key == sections.length - 1 ? 0 : 10),
            child: InkWell(
              onTap: () => onSectionSelected(section.id),
              borderRadius: BorderRadius.circular(999),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? accentColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: isSelected
                        ? accentColor
                        : AppColors.secondaryERP.withValues(alpha: 0.18),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.secondaryERP.withValues(alpha: isSelected ? 0.16 : 0.05),
                      blurRadius: isSelected ? 16 : 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.white : AppColors.heading,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
