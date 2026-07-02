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
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/meeting_calender_model.dart';
import '../bloc/meeting_room_bloc.dart';

class MeetingRoomEditScreen extends StatefulWidget {
  final int roomId;
  final DateTime startTime;
  final DateTime endTime;

  const MeetingRoomEditScreen({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.roomId,
  });

  @override
  State<MeetingRoomEditScreen> createState() => _MeetingRoomEditScreenState();
}

class _MeetingRoomEditScreenState
    extends
        BaseState<
          MeetingRoomEditScreen,
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
  late TextEditingController _employeeController;

  FormFieldState<String>? departField;
  FormFieldState<String>? meetingRoomField;

  int _mapRoomToId(String name) {
    if (name.contains('1')) return 1;
    if (name.contains('2')) return 2;
    if (name.contains('3')) return 3;
    return 1;
  }

  bool _didPrefillCore = false;

  bool _isEndTimeManuallyChanged = false;

  String _mapRoomIdToName(int id) {
    if (id == 2) return 'Meeting Room 2 (Hồ Gươm)';
    if (id == 3) return 'Meeting Room 3 (Hồ Trúc Bạch)';
    return 'Meeting Room 1 (Hồ Tây)';
  }

  String _resolveMeetingOwnerName(MeetingRoomState state) {
    final detail = state.detailMeetingRoom;
    if (detail == null) return '';

    for (final user in state.userMeetings) {
      if (user.id == detail.employeeId) {
        final name = user.fullName?.trim();
        final code = user.code?.trim();

        // ✅ Có cả code + name
        if (code != null && code.isNotEmpty &&
            name != null && name.isNotEmpty) {
          return '$code - $name';
        }

        // ✅ Chỉ có code
        if (code != null && code.isNotEmpty) {
          return code;
        }

        // ✅ Chỉ có name
        if (name != null && name.isNotEmpty) {
          return name;
        }

        break;
      }
    }

    return detail.employeeId.toString();
  }

  @override
  void initState() {
    super.initState();

    _contentController = TextEditingController(); // <-- thiếu cái này
    _employeeController = TextEditingController();
    bloc.add(MeetingRoomEvent.initEdit(roomId: widget.roomId));
    _selectedDate = DateTime(
      widget.startTime.year,
      widget.startTime.month,
      widget.startTime.day,
    );

    _startTime = widget.startTime;
    _endTime = widget.endTime;
  }

  @override
  void dispose() {
    _contentController.dispose();
    _employeeController.dispose();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<MeetingRoomBloc, MeetingRoomState>(
          listenWhen: (prev, curr) =>
              prev.detailMeetingRoom != curr.detailMeetingRoom ||
              prev.departs != curr.departs ||
              prev.userMeetings != curr.userMeetings ||
              prev.submitSuccess != curr.submitSuccess ||
              prev.deleteSuccess != curr.deleteSuccess ||
              prev.status != curr.status,
          listener: (context, state) {
            if (state.deleteSuccess) {
              context.pop(true);
              return;
            }

            if (state.detailMeetingRoom != null) {
              final detail = state.detailMeetingRoom!;
              _employeeController.text = _resolveMeetingOwnerName(state);

              // Prefill phần "core" chỉ 1 lần để không ghi đè lựa chọn người dùng.
              if (!_didPrefillCore) {
                _contentController.text = detail.content;

                if (meetingRoomField != null) {
                  meetingRoomField?.didChange(
                    _mapRoomIdToName(detail.meetingRoomId),
                  );
                }

                _didPrefillCore = true;
              }

              // Prefill phòng ban khi danh sách departs đã tới, nhưng chỉ khi field còn rỗng.
              final currentDepartValue = departField?.value;
              final isDepartEmpty = currentDepartValue == null ||
                  currentDepartValue.toString().trim().isEmpty;

              if (departField != null && isDepartEmpty) {
                String? departName;
                for (final d in state.departs) {
                  if (d.id == detail.departmentId) {
                    departName = d.name;
                    break;
                  }
                }
                departField?.didChange(departName);
              }
            }

            if (state.submitSuccess) {
              context.pop(
                Meeting(
                  eventName: state.content ?? 'Cuộc họp',
                  from: state.timeStart!,
                  to: state.timeEnd!,
                  background: Colors.blue,
                ),
              );
            }

            if (state.status == BaseStateStatus.failed) {
              context.showMessage(state.message ?? 'Có lỗi xảy ra');
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Đặt phòng họp'),
              actions: [
                BlocBuilder<MeetingRoomBloc, MeetingRoomState>(
                  buildWhen: (prev, curr) =>
                      prev.detailMeetingRoom != curr.detailMeetingRoom ||
                      prev.employeeId != curr.employeeId,
                  builder: (context, state) {
                    final detail = state.detailMeetingRoom;
                    final canEdit =
                        detail != null && state.employeeId == detail.employeeId;
                    if (!canEdit) return const SizedBox.shrink();
                    return IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        bloc.add(
                          MeetingRoomEvent.deleteRoom(
                            roomId: widget.roomId,
                            isDelete: true,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            body: BlocBuilder<MeetingRoomBloc, MeetingRoomState>(
              buildWhen: (prev, curr) =>
                  prev.departs != curr.departs ||
                  prev.detailMeetingRoom != curr.detailMeetingRoom ||
                  prev.userMeetings != curr.userMeetings ||
                  prev.employeeId != curr.employeeId ||
                  prev.timeStart != curr.timeStart ||
                  prev.timeEnd != curr.timeEnd ||
                  prev.content != curr.content,
              builder: (context, state) {
                final detail = state.detailMeetingRoom;
                final canEdit = detail != null && state.employeeId == detail.employeeId;

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
                                  /// ===== Nhân viên =====
                                  FormInputField(
                                    icon: Icons.person,
                                    nameForm: 'employee',
                                    nameTextField: 'employee_text',
                                    label: 'Nhân viên',
                                    readOnly: true,
                                    controller: _employeeController,
                                    maxLines: 1,
                                    // onChanged: (v) {
                                    //   bloc.add(
                                    //     MeetingRoomEvent.updateInfo(content: v),
                                    //   );
                                    // },
                                    enabled: false,
                                  ),
                                  const SizedBox(height: 16),

                                  /// ===== NGÀY =====
                                  FormDateTimePicker(
                                    icon: Icons.calendar_today,
                                    nameForm: 'date',
                                    nameTimePicker: 'date_time',
                                    label: 'Ngày đăng ký',
                                    inputType: InputType.date,
                                    initialValue: _selectedDate,
                                    format: DateFormat('dd/MM/yyyy'),
                                    isRequired: true,
                                    validator: (v) {
                                      if (v == null) return 'Vui lòng chọn ngày';
                                      final today = DateTime.now();
                                      final todayOnly = DateTime(today.year, today.month, today.day);
                                      final pickedDate = DateTime(v.year, v.month, v.day);
                                      if (pickedDate.isBefore(todayOnly)) {
                                        return 'Không được chọn ngày trước hiện tại';
                                      }
                                      return null;
                                    },
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

                                  const SizedBox(height: 10),

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
                                          isRequired: true,
                                          validator: (v) {
                                            if (v == null) return 'Vui lòng chọn giờ bắt đầu';
                                            if (v.hour < 8) return 'Giờ bắt đầu không được trước 08:00';
                                            if (v.hour > 17 || (v.hour == 17 && v.minute > 0)) {
                                              return 'Giờ bắt đầu không được quá 17:00';
                                            }
                                            return null;
                                          },
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
                                          isRequired: true,
                                          validator: (v) {
                                            if (v == null) return 'Vui lòng chọn giờ kết thúc';
                                            if (_startTime != null && !v.isAfter(_startTime!)) {
                                              return 'Giờ kết thúc phải lớn hơn giờ bắt đầu';
                                            }
                                            return null;
                                          },
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

                                  const SizedBox(height: 10),

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
                                        isRequired: true,
                                        validator: (v) {
                                          if (v == null || v.isEmpty) return 'Vui lòng chọn phòng ban';
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 10),

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
                                        isRequired: true,
                                        validator: (v) {
                                          if (v == null || v.isEmpty) return 'Vui lòng chọn phòng họp';
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  /// ===== TÊN CUỘC HỌP =====
                                  FormInputField(
                                    icon: Icons.title,
                                    nameForm: 'title',
                                    nameTextField: 'title_text',
                                    label: 'Nội dung cuộc họp',
                                    textInputAction: TextInputAction.newline,
                                    autoExpand: true,
                                    controller: _contentController,
                                    isRequired: true,
                                    validator: (v) {
                                      if (v == null || v.trim().isEmpty) return 'Vui lòng nhập nội dung cuộc họp';
                                      return null;
                                    },
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
                      if (canEdit)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: FormActions(
                            mode: FormActionMode.add,
                            onSubmit: () {
                              FocusScope.of(context).unfocus();

                              if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
                                return;
                              }

                              bloc.add(
                                MeetingRoomEvent.submitEditRoom(
                                  roomId: widget.roomId,
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
                  color: Colors.black.withValues(alpha:0.45),
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
