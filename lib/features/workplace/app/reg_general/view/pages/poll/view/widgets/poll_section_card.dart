import 'package:flutter/material.dart';

import '../../../../../../../../../common/app_theme/index.dart';
import '../../data/datasource/models/poll_model.dart';
import 'poll_background_card.dart';
import 'poll_question_card.dart';

class PollDetailSectionCard extends StatelessWidget {
  const PollDetailSectionCard({
    super.key,
    required this.title,
    required this.description,
    required this.questions,
    required this.backgroundImageUrl,
    required this.accentColor,
    required this.questionReadonlyMap,
    required this.liveFieldValueMap,
    required this.dirtyFields,
    required this.clearedFields,
    required this.questionKeyBuilder,
    required this.invalidQuestionIds,
    required this.showValidationErrors,
    required this.onAnswerChanged,
  });

  final String? title;
  final String? description;
  final List<PollQuestionItem> questions;
  final String? backgroundImageUrl;
  final Color accentColor;
  final Map<int, bool> questionReadonlyMap;
  final Map<String, String?> liveFieldValueMap;
  final Set<String> dirtyFields;
  final Set<String> clearedFields;
  final GlobalKey Function(int? questionId) questionKeyBuilder;
  final Set<int> invalidQuestionIds;
  final bool showValidationErrors;
  final void Function(String fieldKey, String? value) onAnswerChanged;

  bool get _hasSectionHeader =>
      (title?.trim().isNotEmpty == true) || (description?.trim().isNotEmpty == true);

  @override
  Widget build(BuildContext context) {
    return BlurredBackgroundCard(
      imageUrl: backgroundImageUrl,
      accentColor: accentColor,
      borderRadius: 22,
      blurSigma: 10,
      borderColor: AppColors.white.withValues(alpha: 0.28),
      imageOverlayColors: [
        AppColors.white.withValues(alpha: 0.88),
        AppColors.white.withValues(alpha: 0.80),
      ],
      fallbackOverlayColors: [AppColors.white, const Color(0xFFF8FAFD)],
      boxShadow: [
        BoxShadow(
          color: AppColors.secondaryERP.withValues(alpha: 0.06),
          blurRadius: 18,
          offset: const Offset(0, 10),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_hasSectionHeader) ...[
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title?.trim().isNotEmpty == true)
                    Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.heading,
                      ),
                    ),
                  if (description?.trim().isNotEmpty == true) ...[
                    const SizedBox(height: 6),
                    Text(
                      description!,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: AppColors.hintText,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
          Padding(
            padding: EdgeInsets.fromLTRB(18, _hasSectionHeader ? 0 : 18, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: questions.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;
                final isLast = index == questions.length - 1;
                final readonly = questionReadonlyMap[question.id] ?? false;

                return Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
                  child: PollQuestionReadonlyCard(
                    key: questionKeyBuilder(question.id),
                    question: question,
                    readonly: readonly,
                    displayOrder: question.sortOrder ?? index + 1,
                    liveFieldValueMap: liveFieldValueMap,
                    dirtyFields: dirtyFields,
                    clearedFields: clearedFields,
                    showValidationError:
                        showValidationErrors && invalidQuestionIds.contains(question.id),
                    onAnswerChanged: onAnswerChanged,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
