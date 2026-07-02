import 'package:flutter/material.dart';
import 'package:rtc_erp/features/workplace/app/week_plan/view/pages/week_plan_list_screen.dart';

/// Màn hình "Công việc tôi giao" (viewNumber = 3).
class WeekPlanAssignedScreen extends StatelessWidget {
  const WeekPlanAssignedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WeekPlanListScreen(
      viewNumber: 3,
      title: 'Việc tôi giao',
      isAssigned: true,
    );
  }
}
