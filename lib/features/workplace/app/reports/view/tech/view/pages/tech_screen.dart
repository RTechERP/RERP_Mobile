import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rtc_erp/base/widgets/base_scaffold.dart';

import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/card/index.dart';
import '../bloc/tech_bloc.dart';
class TechScreen extends StatelessWidget {
  const TechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('report.tech'.tr(), style: AppStyles.headingTitle2),
      ),
      body: BlocBuilder<TechBloc, TechState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.reports.length,
            itemBuilder: (context, index) {
              final r = state.reports[index];

              return AppCardReport(
                category: r.projectName,
                project: r.projectText,
                time: r.createdDate,
                progress: ((r.percentComplete) / 100).clamp(0, 1),
                onTap: () {
                  context.push('/report/tech/detail?index=$index');
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/report/tech/add'),
        backgroundColor: AppColors.primaryERP,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}


