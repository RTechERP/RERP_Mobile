import 'package:flutter/material.dart';
import 'package:rtc_erp/features/workplace/app/week_plan/view/pages/week_plan_list_screen.dart';

/// Màn hình "Công việc của tôi" (viewNumber = 1).
class WeekPlanMyTaskScreen extends StatelessWidget {
  const WeekPlanMyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WeekPlanListScreen(
      viewNumber: 1,
      title: 'Việc giao tôi',
    );
  }
}
