import 'package:flutter/material.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../data/datasource/models/salary_model.dart';
import '../bloc/salary_bloc.dart';
import '../widgets/salary_overview_month_bar.dart';
import '../widgets/salary_overview_section_card.dart';

class SalaryOverviewScreen extends StatefulWidget {
  const SalaryOverviewScreen({super.key});

  @override
  State<SalaryOverviewScreen> createState() => _SalaryOverviewScreenState();
}

class _SalaryOverviewScreenState
    extends BaseShareState<SalaryOverviewScreen, SalaryEvent, SalaryState, SalaryBloc> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(const SalaryEvent.init());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Tổng hợp', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      backgroundColor: AppColors.background,
      body: blocBuilder((context, state) {
        if (state.status == BaseStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: () async => bloc.add(const SalaryEvent.refresh()),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SalaryOverviewMonthBar(
                    selectedMonth: state.selectedMonth,
                    onMonthChanged: (month) => bloc.add(SalaryEvent.changeMonth(month)),
                  ),
                  const SizedBox(height: 16),
                  ..._buildSections(state.listSummary ?? []),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  List<Widget> _buildSections(List<List<SalarySummaryItem>> allItems) {
    final grouped = <String, List<SalarySummaryItem>>{};
    final typeTableMap = <String, int>{};
    for (final list in allItems) {
      for (final item in list) {
        final typeText = item.typeText ?? '';
        grouped.putIfAbsent(typeText, () => []).add(item);
        if (!typeTableMap.containsKey(typeText)) {
          typeTableMap[typeText] = item.typeTable ?? 0;
        }
      }
    }

    final sorted = grouped.keys.toList()
      ..sort((a, b) => (typeTableMap[a] ?? 0).compareTo(typeTableMap[b] ?? 0));

    return sorted.map((typeText) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SalaryOverviewSectionCard(
        sectionTitle: typeText,
        items: grouped[typeText]!,
      ),
    )).toList();
  }
}
