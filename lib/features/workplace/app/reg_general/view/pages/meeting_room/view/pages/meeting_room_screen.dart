import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../data/datasource/models/meeting_calender_model.dart';
import '../../data/datasource/models/meeting_room_mapper.dart';
import '../bloc/meeting_room_bloc.dart';
import 'meeting_room_add_screen.dart';

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
    if (details.targetElement == CalendarElement.calendarCell) {
      final selectedDate = details.date!;

      final Meeting? meeting = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MeetingRoomAddScreen(startTime: selectedDate),
        ),
      );

      if (meeting != null) {
        final ds = _dataSources[roomIndex]!;

        final newMeeting = Meeting(
          eventName: meeting.from.toString(),
          from: meeting.from,
          to: meeting.to,
          background: generateNiceColor(meeting.eventName),
        );

        setState(() {
          ds.appointments!.add(newMeeting);
          ds.notifyListeners(CalendarDataSourceAction.add, [newMeeting]);
        });
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
        startHour: 8,
        endHour: 18,
        timeInterval: Duration(minutes: 30),
        timeFormat: 'HH:mm',
        timeIntervalHeight: 45, // tăng chiều cao để fill đẹp hơn
      ),
    );
  }
}
