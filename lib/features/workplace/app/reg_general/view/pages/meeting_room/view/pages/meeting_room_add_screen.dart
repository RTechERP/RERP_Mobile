import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../bloc/meeting_room_bloc.dart';

class MeetingRoomAddScreen extends StatefulWidget {
  final DateTime startTime;

  const MeetingRoomAddScreen({super.key, required this.startTime});

  @override
  State<MeetingRoomAddScreen> createState() => _MeetingRoomAddScreenState();
}

class _MeetingRoomAddScreenState
    extends
        BaseState<
          MeetingRoomAddScreen,
          MeetingRoomEvent,
          MeetingRoomState,
          MeetingRoomBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  DateTime? _startTime;
  DateTime? _endTime;

  DateTime? _selectedDate;

  DateTime combine(DateTime date, DateTime time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  late TextEditingController _contentController;

  FormFieldState<String>? departField;
  FormFieldState<String>? meetingRoomField;

  int _mapRoomToId(String name) {
    if (name.contains('1')) return 1;
    if (name.contains('2')) return 2;
    if (name.contains('3')) return 3;
    return 1;
  }

  bool isStartTimeInvalid(DateTime start) {
    return start.hour < 8 ||
        start.hour > 17 ||
        (start.hour == 17 && start.minute > 0);
  }

  bool _isEndTimeManuallyChanged = false;
  @override
  void initState() {
    super.initState();

    _contentController = TextEditingController(); // <-- thiếu cái này
    bloc.add(MeetingRoomEvent.initAdd());
    _selectedDate = widget.startTime;

    _startTime = widget.startTime;
    _endTime = widget.startTime.add(const Duration(hours: 2));
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<MeetingRoomBloc, MeetingRoomState>(
          listenWhen: (prev, curr) =>
              prev.submitSuccess != curr.submitSuccess ||
              prev.status != curr.status ||
              (prev.departs != curr.departs && curr.departs.isNotEmpty) ||
              (prev.departmentId != curr.departmentId &&
                  curr.departmentId != null),
          listener: (context, state) {
            if (state.submitSuccess) {
              context.pop(true);
              return;
            }

            if (state.status == BaseStateStatus.failed) {
              context.showMessage(state.message ?? 'Có lỗi xảy ra');
            }

            /// Auto-fill phòng ban theo departmentId của user hiện tại
            if (state.departs.isNotEmpty && state.departmentId != null) {
              final matched = state.departs.where(
                (d) => d.id == state.departmentId,
              );
              if (matched.isNotEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  departField?.didChange(matched.first.name);
                });
              }
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(title: const Text('Đặt phòng họp')),
            body: BlocBuilder<MeetingRoomBloc, MeetingRoomState>(
              buildWhen: (prev, curr) =>
                  prev.departs != curr.departs ||
                  prev.departmentId != curr.departmentId,
              builder: (context, state) {
                return FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            FormCard(
                              child: Column(
                                children: [
                                  /// ===== NGÀY =====
                                  FormDateTimePicker(
                                    icon: Icons.calendar_today,
                                    nameForm: 'date',
                                    nameTimePicker: 'date_time',
                                    label: 'Ngày đăng ký',
                                    inputType: InputType.date,
                                    initialValue: _selectedDate,
                                    format: DateFormat('dd/MM/yyyy'),
                                    onChanged: (v) {
                                      if (v != null) {
                                        _selectedDate = v;

                                        if (_startTime != null) {
                                          _startTime = combine(v, _startTime!);
                                        }
                                        if (_endTime != null) {
                                          _endTime = combine(v, _endTime!);
                                        }
                                      }
                                    },
                                  ),

                                  const SizedBox(height: 8),

                                  /// ===== BẮT ĐẦU =====
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FormDateTimePicker(
                                          icon: Icons.access_time,
                                          nameForm: 'start_time',
                                          nameTimePicker: 'start_time_picker',
                                          label: 'Bắt đầu',
                                          inputType: InputType.time,
                                          initialValue: _startTime,
                                          format: DateFormat('HH:mm'),
                                          onChanged: (v) {
                                            if (v != null && _selectedDate != null) {
                                              final newStart = combine(_selectedDate!, v);

                                              _startTime = newStart;

                                              // ❗ reset endTime nếu invalid
                                              if (_endTime != null && !_endTime!.isAfter(_startTime!)) {
                                                _endTime = null;
                                                _isEndTimeManuallyChanged = false;

                                                _formKey.currentState?.fields['end_time_picker']
                                                    ?.didChange(null);
                                              }

                                              // ✅ auto +2h nếu user chưa chỉnh endTime
                                              if (!_isEndTimeManuallyChanged) {
                                                final newEnd = newStart.add(const Duration(hours: 2));
                                                _endTime = newEnd;

                                                _formKey.currentState?.fields['end_time_picker']
                                                    ?.didChange(newEnd);
                                              }
                                            }
                                          },
                                        ),
                                      ),

                                      const SizedBox(width: 16),

                                      /// ===== KẾT THÚC =====
                                      Expanded(
                                        child: FormDateTimePicker(
                                          icon: Icons.access_time_filled,
                                          nameForm: 'end_time',
                                          nameTimePicker: 'end_time_picker',
                                          label: 'Kết thúc',
                                          inputType: InputType.time,
                                          initialValue: _endTime,
                                          format: DateFormat('HH:mm'),
                                          onChanged: (v) {
                                            if (v != null && _selectedDate != null) {
                                              _isEndTimeManuallyChanged = true;
                                              _endTime = combine(_selectedDate!, v);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 8),

                                  /// ===== PHÒNG BAN =====
                                  GestureDetector(
                                    onTap: () {
                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn phòng ban',
                                        items: state.departs,
                                        onSelected: (item) {
                                          departField?.didChange(item.name);
                                          bloc.add(
                                            MeetingRoomEvent.updateInfo(
                                              departmentId: item.id,
                                            ),
                                          );
                                        },
                                        displayText: (item) => item.name,
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm: 'department',
                                        nameTextField: 'department_text',
                                        label: 'Phòng ban',
                                        onFieldCreated: (field) =>
                                            departField = field,
                                        readOnly: true,
                                        icon: Icons.apartment,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  /// ===== PHÒNG HỌP =====
                                  GestureDetector(
                                    onTap: () {
                                      openSelectBottomSheet(
                                        context: context,
                                        title: 'Chọn phòng họp',
                                        items: const [
                                          'Meeting Room 1 (Hồ Tây)',
                                          'Meeting Room 2 (Hồ Gươm)',
                                          'Meeting Room 3 (Hồ Trúc Bạch)',
                                        ],
                                        onSelected: (item) {
                                          /// set text hiển thị
                                          meetingRoomField?.didChange(item);

                                          /// map sang id
                                          final roomId = _mapRoomToId(item);

                                          /// update bloc
                                          bloc.add(
                                            MeetingRoomEvent.updateInfo(
                                              selectedRoomId: roomId,
                                            ),
                                          );
                                        },
                                        displayText: (item) => item,
                                      );
                                    },
                                    child: AbsorbPointer(
                                      child: FormInputField(
                                        nameForm: 'meeting_room',
                                        nameTextField: 'meeting_room_text',
                                        label: 'Phòng họp',
                                        onFieldCreated: (field) =>
                                            meetingRoomField = field,
                                        icon: Icons.meeting_room_outlined,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  /// ===== TÊN CUỘC HỌP =====
                                  FormInputField(
                                    icon: Icons.title,
                                    nameForm: 'title',
                                    nameTextField: 'title_text',
                                    label: 'Nội dung cuộc họp',
                                    maxLines: 3,
                                    controller: _contentController,
                                    onChanged: (v) {
                                      bloc.add(
                                        MeetingRoomEvent.updateInfo(content: v),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// ===== ACTION =====
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 8.0,
                        ),
                        child: FormActions(
                          mode: FormActionMode.add,
                          onSubmit: () {
                            FocusScope.of(context).unfocus();

                            final error = ValidateHelper.validateMeetingRoom(
                              date: _selectedDate,
                              startTime: _startTime,
                              endTime: _endTime,
                              roomId: bloc.state.selectedRoomId,
                              departmentId: bloc.state.departmentId,
                              content: _contentController.text,
                            );

                            if (error != null) {
                              context.showMessage(
                                error,
                                type: SnackBarType.error,
                              );
                              return;
                            }

                            bloc.add(
                              MeetingRoomEvent.submitRoom(
                                startTime: _startTime!,
                                endTime: _endTime!,
                                dateRegister: _selectedDate!,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

        /// ===== LOADING OVERLAY =====
        BlocBuilder<MeetingRoomBloc, MeetingRoomState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
            if (!state.isSubmitting) {
              return const SizedBox.shrink();
            }

            return Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Colors.black.withOpacity(0.45),
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/lotties/Loading.json',
                    width: 240,
                    height: 240,
                    repeat: true,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
