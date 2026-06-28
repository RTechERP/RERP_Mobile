import 'package:flutter/material.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../bloc/approve_timesheet_bloc.dart';

class ApproveTimesheetSeniorScreen extends StatefulWidget {
  const ApproveTimesheetSeniorScreen({super.key});

  @override
  State<ApproveTimesheetSeniorScreen> createState() =>
      _ApproveTimesheetSeniorScreenState();
}

class _ApproveTimesheetSeniorScreenState
    extends
    BaseState<
        ApproveTimesheetSeniorScreen,
        ApproveTimesheetEvent,
        ApproveTimesheetState,
        ApproveTimesheetBloc
    > {
  @override
  Widget renderUI(BuildContext context) {
    return const BaseScaffold(
      body: Center(
        child: Text('Approve Senior Timesheet'),
      ),
    );
  }
}
