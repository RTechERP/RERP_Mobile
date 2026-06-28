import 'package:flutter/material.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../bloc/approve_timesheet_bloc.dart';

class ApproveTimesheetScreen extends StatefulWidget {
  const ApproveTimesheetScreen({super.key});

  @override
  State<ApproveTimesheetScreen> createState() =>
      _ApproveTimesheetScreenState();
}

class _ApproveTimesheetScreenState
    extends
    BaseState<
        ApproveTimesheetScreen,
        ApproveTimesheetEvent,
        ApproveTimesheetState,
        ApproveTimesheetBloc
    > {
  @override
  Widget renderUI(BuildContext context) {
    return const BaseScaffold(
      body: Center(
        child: Text('Approve Timesheet'),
      ),
    );
  }
}
