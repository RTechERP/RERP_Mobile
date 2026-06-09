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
  @override
  void initState() {
    super.initState();
    bloc.add(PollEvent.initDetail(widget.item));
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
          final surveySections = _buildSurveySections(detail);

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
                const SizedBox(height: 16),
                ...surveySections.asMap().entries.map(
                  (entry) => Padding(
                    padding: EdgeInsets.only(top: entry.key == 0 ? 0 : 16),
                    child: PollDetailSectionCard(
                      title: entry.value.title,
                      description: entry.value.description,
                      questions: entry.value.questions,
                      backgroundImageUrl: backgroundImageUrl,
                      accentColor: accentColor,
                      questionReadonlyMap: state.questionReadonlyMap,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<_SurveySectionData> _buildSurveySections(PollDetailItem detail) {
    final sections = (detail.sections ?? const <PollSectionItem>[])
        .where((section) => (section.questions ?? const []).isNotEmpty)
        .toList()
      ..sort((a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0));
    final rootQuestions = (detail.questions ?? const <PollQuestionItem>[]).toList()
      ..sort((a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0));

    final hasStandaloneQuestions =
        rootQuestions.where((question) => question.sectionId == null).isNotEmpty;

    return [
      if (hasStandaloneQuestions)
        _SurveySectionData(
          title: null,
          description: null,
          questions: rootQuestions
              .where((question) => question.sectionId == null)
              .toList(),
        ),
      ...sections.map(
        (section) => _SurveySectionData(
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
    required this.title,
    required this.description,
    required this.questions,
  });

  final String? title;
  final String? description;
  final List<PollQuestionItem> questions;
}
