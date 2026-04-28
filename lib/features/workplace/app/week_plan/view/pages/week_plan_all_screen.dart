import 'package:flutter/material.dart';
import 'package:rtc_erp/features/workplace/app/week_plan/view/pages/week_plan_list_screen.dart';

/// Màn hình "Tổng công việc" (viewNumber = -1).
class WeekPlanAllScreen extends StatelessWidget {
  const WeekPlanAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const WeekPlanListScreen(
      viewNumber: -1,
      title: 'Tổng công việc',
    );
  }
}
