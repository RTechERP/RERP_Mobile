import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/poll_model.dart';
import '../bloc/poll_bloc.dart';
import '../widgets/poll_detail_helpers.dart';
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

    if (_liveFieldValueMap[normalizedKey] == nextValue) return;

    setState(() {
      _liveFieldValueMap = {
        ..._liveFieldValueMap,
        normalizedKey: nextValue,
      };
    });
  }

  void _onSectionSelected(int? sectionId) {
    if (_selectedSectionId == sectionId) return;
    setState(() => _selectedSectionId = sectionId);
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

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: const AppBarCommon(title: Text('Chi tiết bình chọn')),
      body: BlocBuilder<PollBloc, PollState>(
        buildWhen: (prev, curr) =>
            prev.isDetailLoading != curr.isDetailLoading ||
            prev.detailData != curr.detailData ||
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

          return RefreshIndicator(
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
                    detail.startDate ?? widget.item.startDate,
                  ),
                  endDateText: _formatDetailDateTime(
                    detail.endDate ?? widget.item.endDate,
                  ),
                  backgroundImageUrl: backgroundImageUrl,
                  accentColor: accentColor,
                  titleColorValue: detail.titleColor ?? widget.item.titleColor,
                ),
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
                    onAnswerChanged: _onAnswerChanged,
                  ),
                ],
              ],
            ),
          );
        },
      ),
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
