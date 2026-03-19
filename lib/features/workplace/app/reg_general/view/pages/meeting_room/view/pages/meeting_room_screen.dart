import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../routes/route_names.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../data/datasource/models/meeting_calender_model.dart';
import '../../data/datasource/models/meeting_room_mapper.dart';
import '../bloc/meeting_room_bloc.dart';
import 'package:go_router/go_router.dart';

class MeetingRoomScreen extends StatefulWidget {
  const MeetingRoomScreen({super.key});

  @override
  State<MeetingRoomScreen> createState() => _MeetingRoomScreenState();
}

class _MeetingRoomScreenState
    extends
        BaseState<
          MeetingRoomScreen,
          MeetingRoomEvent,
          MeetingRoomState,
          MeetingRoomBloc
        > {
  late Map<int, MeetingDataSource> _dataSources;

  final CalendarController _calendarController = CalendarController();
  final rooms = [
    MeetingRoom('Meeting Room 1 (Hồ Tây)'),
    MeetingRoom('Meeting Room 2 (Hồ Gươm)'),
    MeetingRoom('Meeting Room 3 (Hồ Trúc Bạch)'),
  ];
  @override
  void initState() {
    super.initState();
    bloc.add(const MeetingRoomEvent.init());

    _calendarController.view = CalendarView.week;

    _dataSources = {
      for (int i = 0; i < rooms.length; i++) i: MeetingDataSource([]),
    };
  }

  void _bindData(MeetingRoomState state) {
    final data = state.meetingRoom;

    if (data == null) return;

    final mapped = MeetingRoomMapper.map(data);

    setState(() {
      _dataSources = mapped;
    });
  }

  void _onTap(CalendarTapDetails details, int roomIndex) async {
    final selectedDate = details.date;
    if (selectedDate == null) return;

    /// Nếu tap vào đoạn đã có dữ liệu (appointment) thì chuyển sang màn edit.
    final appts = details.appointments;
    if (appts != null && appts.isNotEmpty) {
      Meeting? meeting;
      for (final a in appts) {
        if (a is Meeting) {
          meeting = a;
          break;
        }
      }

      final roomId = meeting?.roomId;
      if (roomId != null) {
        final result = await context.push(
          RouteNames.meetingRoomEdit,
          extra: {
            'roomId': roomId,
            'startTime': selectedDate,
          },
        );

        // reload lại calendar khi vừa edit xong
        if (result != null) {
          bloc.add(const MeetingRoomEvent.init());
        }
        return;
      }
    }

    /// Nếu tap vào "calendar cell" (trống) thì mở màn add.
    if (details.targetElement == CalendarElement.calendarCell) {
      // Dùng context.push thay cho Navigator.push
      final shouldReload = await context.push<bool>(
        RouteNames.meetingRoomAdd,
        extra: {
          'startTime': selectedDate,
        },
      );

      // Sau khi add xong (pop(true)) thì reload từ API để đồng bộ.
      if (shouldReload == true) {
        bloc.add(const MeetingRoomEvent.init());
      }
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<MeetingRoomBloc, MeetingRoomState>(
      listener: (context, state) {
        if (state.status == BaseStateStatus.success) {
          _bindData(state);
        }
      },
      child: DefaultTabController(
        length: rooms.length,
        child: BaseScaffold(
          backgroundColor: AppColors.white,
          appBar: AppBarCommon(
            title: const Text('Phòng họp'),
            onBackTap: () => onBack(context),
            bottom: TabBar(
              isScrollable: true,
              tabs: rooms.map((r) => Tab(text: r.name)).toList(),
            ),
          ),
          body: TabBarView(
            children: List.generate(
              rooms.length,
              (index) => _buildCalendar(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar(int roomIndex) {
    final dataSource = _dataSources[roomIndex]!;

    return SfCalendar(
      controller: _calendarController,
      view: CalendarView.week,
      dataSource: dataSource,
      allowedViews: const [CalendarView.day, CalendarView.week],
      showDatePickerButton: true,
      onTap: (details) => _onTap(details, roomIndex),
      timeSlotViewSettings: const TimeSlotViewSettings(
        startHour: 7.5,
        endHour: 18,
        timeInterval: Duration(minutes: 30),
        timeFormat: 'HH:mm',
        timeIntervalHeight: 50,
      ),
      showCurrentTimeIndicator: true,
    );
  }
}
