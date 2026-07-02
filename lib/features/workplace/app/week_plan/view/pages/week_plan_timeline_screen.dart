import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../base/widgets/base_widget.dart';
import '../../../../../../common/app_theme/index.dart';

import '../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../data/datasource/models/week_plan_model.dart';
import '../bloc/week_plan_bloc.dart';

class WeekPlanTimelineScreen extends StatefulWidget {
  const WeekPlanTimelineScreen({super.key});

  @override
  State<WeekPlanTimelineScreen> createState() => _WeekPlanTimelineScreenState();
}

class _WeekPlanTimelineScreenState
    extends
        BaseState<
          WeekPlanTimelineScreen,
          WeekPlanEvent,
          WeekPlanState,
          WeekPlanBloc
        > {
  late DateTime _currentMonth;
  DateTime? _selectedDate;

  static const _dowShort = ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'];
  static const _dowFull = [
    'Chủ nhật',
    'Thứ 2',
    'Thứ 3',
    'Thứ 4',
    'Thứ 5',
    'Thứ 6',
    'Thứ 7',
  ];
  static const _monthNames = [
    'Tháng 1',
    'Tháng 2',
    'Tháng 3',
    'Tháng 4',
    'Tháng 5',
    'Tháng 6',
    'Tháng 7',
    'Tháng 8',
    'Tháng 9',
    'Tháng 10',
    'Tháng 11',
    'Tháng 12',
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _currentMonth = DateTime(now.year, now.month);
    final start = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final end = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(WeekPlanEvent.fetchTimelineData(dateStart: start, dateEnd: end));
    });
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      _selectedDate = null;
    });
    final start = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final end = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    bloc.add(WeekPlanEvent.fetchTimelineData(dateStart: start, dateEnd: end));
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      _selectedDate = null;
    });
    final start = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final end = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    bloc.add(WeekPlanEvent.fetchTimelineData(dateStart: start, dateEnd: end));
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _formatDateKey(DateTime d) {
    return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  Map<String, List<ProjectTaskTimelineItem>> _groupTasksByDate(
    List<ProjectTaskTimelineResponse> responses,
  ) {
    final Map<String, List<ProjectTaskTimelineItem>> map = {};
    for (final res in responses) {
      for (final dateKey in res.dailyHours.keys) {
        map.putIfAbsent(dateKey, () => []).add(res.task);
      }
    }
    return map;
  }

  Set<String> _buildDayOffSet(List<DayOffItem> items) {
    return items
        .map((e) => e.dateOff)
        .whereType<DateTime>()
        .map(_formatDateKey)
        .toSet();
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text('Kế hoạch tháng', style: AppStyles.headingTitle2),
        onBackTap: () => onBack(context),
      ),
      body: BlocBuilder<WeekPlanBloc, WeekPlanState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  _buildCalendarCard(state),
                  if (_selectedDate != null) ...[
                    SizedBox(height: 16.h),
                    _buildSelectedDateTasks(state),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCalendarCard(WeekPlanState state) {
    final firstDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month + 1,
      0,
    );
    final startWeekday = firstDayOfMonth.weekday % 7;
    final daysInMonth = lastDayOfMonth.day;

    final tasksByDate = _groupTasksByDate(state.timelineTasks);
    final dayOffKeys = _buildDayOffSet(state.dayOffDates);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          SizedBox(height: 16.h),
          _buildDaysOfWeek(),
          SizedBox(height: 8.h),
          _buildCalendarGrid(
            firstDayOfMonth,
            startWeekday,
            daysInMonth,
            tasksByDate,
            dayOffKeys,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.chevron_left_rounded,
              color: AppColors.primaryERP,
              size: 28,
            ),
            onPressed: _previousMonth,
          ),
          Row(
            children: [
              Text(
                _monthNames[_currentMonth.month - 1],
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.arrow_drop_down_rounded,
                color: AppColors.heading,
                size: 24,
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.chevron_right_rounded,
              color: AppColors.primaryERP,
              size: 28,
            ),
            onPressed: _nextMonth,
          ),
        ],
      ),
    );
  }

  Widget _buildDaysOfWeek() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.r),
      child: Row(
        children: _dowShort.map((day) {
          final isWeekend = day == 'CN';
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: isWeekend ? AppColors.alert : AppColors.heading,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCalendarGrid(
    DateTime firstDayOfMonth,
    int startWeekday,
    int daysInMonth,
    Map<String, List<ProjectTaskTimelineItem>> tasksByDate,
    Set<String> dayOffKeys,
  ) {
    final List<Widget> dayWidgets = [];

    for (int i = 0; i < startWeekday; i++) {
      dayWidgets.add(const SizedBox.shrink());
    }

    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(_currentMonth.year, _currentMonth.month, day);
      final key = _formatDateKey(date);
      final tasks = tasksByDate[key] ?? const [];
      final isDayOff = dayOffKeys.contains(key);
      dayWidgets.add(_buildDayCell(date, tasks, isDayOff));
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.r),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 7,
        childAspectRatio: 0.85,
        mainAxisSpacing: 4.h,
        crossAxisSpacing: 4.w,
        children: dayWidgets,
      ),
    );
  }

  Widget _buildDayCell(
    DateTime date,
    List<ProjectTaskTimelineItem> tasks, [
    bool isDayOff = false,
  ]) {
    final isToday = _isToday(date);
    final isSelected =
        _selectedDate != null && _isSameDay(date, _selectedDate!);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDate = date;
        });
      },
      child: Container(
        margin: EdgeInsets.all(2.r),
        decoration: BoxDecoration(
          color: isDayOff ? AppColors.alert.withValues(alpha: 0.08) : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? Colors.lightBlue
                : isDayOff
                ? AppColors.alert.withValues(alpha: 0.4)
                : Colors.grey.shade200,
            width: isSelected
                ? 1.5
                : isDayOff
                ? 1
                : 0.5,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.r),
              decoration: BoxDecoration(
                color: isToday
                    ? Colors.lightBlue
                    : isDayOff
                    ? AppColors.alert
                    : Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7.r),
                  topRight: Radius.circular(7.r),
                ),
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: isToday || isSelected
                        ? FontWeight.w700
                        : FontWeight.w500,
                    color: isToday || isDayOff
                        ? Colors.white
                        : AppColors.heading,
                  ),
                ),
              ),
            ),
            Expanded(
              child: tasks.isEmpty
                  ? isDayOff
                        ? Padding(
                            padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
                            child: Text(
                              'OFF',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.alert,
                                letterSpacing: 0.5,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  : Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                      child: Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          color: isToday ? Colors.lightBlue : Colors.orange,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedDateTasks(WeekPlanState state) {
    final key = _formatDateKey(_selectedDate!);
    final tasksByDate = _groupTasksByDate(state.timelineTasks);
    final tasks = tasksByDate[key] ?? const [];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.event_note_rounded,
                  color: AppColors.primaryERP,
                  size: 20,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.heading,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      _dowFull[_selectedDate!.weekday % 7],
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 4.r),
                decoration: BoxDecoration(
                  color: AppColors.primaryERP.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '${tasks.length} công việc',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryERP,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(height: 1.h, color: Colors.grey.shade200),
          SizedBox(height: 12.h),
          if (tasks.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Center(
                child: Text(
                  'Không có công việc nào',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ),
            )
          else
            ...tasks.map((t) => _buildTaskCard(t)),
        ],
      ),
    );
  }

  Widget _buildTaskCard(ProjectTaskTimelineItem task) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 4.h),
            width: 4.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: _getStatusColor(task.status),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.projectTaskCode ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryERP,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  task.projectTaskTitle ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.heading,
                    height: 1.3,
                  ),
                ),
                if (task.planStartDate != null || task.planEndDate != null) ...[
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(
                        Icons.event_available_rounded,
                        size: 12,
                        color: AppColors.textSecondaryColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        _formatDateRange(task.planStartDate, task.planEndDate),
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.textSecondaryColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateRange(DateTime? start, DateTime? end) {
    String fmt(DateTime d) =>
        '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
    if (start != null && end != null) {
      if (_isSameDay(start, end)) return fmt(start);
      return '${fmt(start)} - ${fmt(end)}';
    }
    if (start != null) return fmt(start);
    if (end != null) return fmt(end);
    return '';
  }

  Color _getStatusColor(int? status) {
    switch (status) {
      case 0:
        return Colors.grey;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.green;
      case 3:
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }
}
