import 'package:flutter/material.dart';
import 'package:rtc_erp/features/workplace/app/week_plan/view/pages/week_plan_list_screen.dart';

/// Màn hình "Công việc liên quan" (viewNumber = 2).
class WeekPlanRelatedScreen extends StatelessWidget {
  const WeekPlanRelatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WeekPlanListScreen(
      viewNumber: 2,
      title: 'Liên quan',
    );
  }
}
