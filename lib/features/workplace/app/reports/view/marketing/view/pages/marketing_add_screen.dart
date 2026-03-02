import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rtc_erp/common/helpers/validate_helper.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/marketing_bloc.dart';

class MarketingAddScreen extends StatefulWidget {
  const MarketingAddScreen({super.key});

  @override
  State<MarketingAddScreen> createState() => _MarketingAddScreenState();
}

class _MarketingAddScreenState
    extends
        BaseState<
          MarketingAddScreen,
          MarketingEvent,
          MarketingState,
          MarketingBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  DateTime? _initialReportDate() {
    final now = DateTime.now();

    // 09:00 hôm nay
    final todayAt9 = DateTime(now.year, now.month, now.day, 9);

    // Nếu trước 09:00 => null, sau 09:00 => now
    if (now.isBefore(todayAt9)) return null;
    return now;
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const MarketingEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<MarketingBloc, MarketingState>(
          listenWhen: (previous, current) =>
              previous.submitSuccess != current.submitSuccess,
          listener: (context, state) {
            if (state.submitSuccess) {
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(title: Text('Tạo báo cáo')),
            body: BlocBuilder<MarketingBloc, MarketingState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: FormBuilder(
                        key: _formKey,
                        initialValue: {'date': DateTime.now()},
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            /// ===== NGÀY BÁO CÁO =====
                            FormCard(
                              child: FormDateTimePicker(
                                icon: Icons.calendar_today,
                                nameForm: 'marketing_add_date',
                                nameTimePicker: 'date_time',
                                label: 'Ngày báo cáo',
                                inputType: InputType.date,
                                initialValue: _initialReportDate(),
                                format: DateFormat('dd/MM/yyyy'),
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// ===== NỘI DUNG CÔNG VIỆC =====
                            FormCard(
                              title: 'Nội dung công việc',
                              child: FormInputField(
                                icon: Icons.note_alt_outlined,
                                nameForm: 'marketing_add_content',
                                nameTextField: 'content',
                                label: 'Nội dung công việc',
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction
                                    .newline, // ⬅ Enter xuống dòng
                                onChanged: (v) {
                                  bloc.add(
                                    MarketingEvent.updateWork(content: v),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// ===== KẾT QUẢ =====
                            FormCard(
                              title: 'Kết quả',
                              child: FormInputField(
                                icon: Icons.task_alt_outlined,
                                nameForm: 'marketing_add_result',
                                nameTextField: 'result',
                                label: 'Kết quả đạt được',
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction
                                    .newline, // ⬅ Enter xuống dòng
                                onChanged: (v) {
                                  bloc.add(
                                    MarketingEvent.updateWork(results: v),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// ===== KẾ HOẠCH NGÀY TIẾP THEO =====
                            FormCard(
                              title: 'Kế hoạch ngày tiếp theo',
                              child: FormInputField(
                                icon: Icons.next_plan_outlined,
                                nameForm: 'marketing_add_next_plan',
                                nameTextField: 'next_plan',
                                label: 'Kế hoạch ngày tiếp theo',
                                maxLines: 3,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction
                                    .newline, // ⬅ Enter xuống dòng
                                onChanged: (v) {
                                  bloc.add(
                                    MarketingEvent.updateWork(planNextDay: v),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// ===== ĐỀ XUẤT CẢI TIẾN =====
                            FormCard(
                              title: 'Đề xuất cải tiến phòng Marketing',
                              child: FormInputField(
                                icon: Icons.lightbulb_outline,
                                nameForm: 'marketing_add_improve',
                                nameTextField: 'improve',
                                label: 'Đề xuất cải tiến',
                                maxLines: 4,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction
                                    .newline, // ⬅ Enter xuống dòng
                                onChanged: (v) {
                                  bloc.add(MarketingEvent.updateWork(note: v));
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// ===== FILE ĐÍNH KÈM =====
                            FormCard(
                              title: 'Bảng đính kèm file',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Picker
                                  FormFilePicker(
                                    name: 'attachments',
                                    label: 'Chọn file đính kèm',
                                    icon: Icons.attach_file,
                                    allowMultiple: true,
                                    onChanged: (files) {
                                      final dartFiles = files
                                          .where((e) => e.path != null)
                                          .map((e) => File(e.path!))
                                          .toList();

                                      bloc.add(
                                        MarketingEvent.setLocalFiles(dartFiles),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 8),

                                  /// Danh sách file đã chọn
                                  if ((state.localFiles?.isNotEmpty ?? false))
                                    Column(
                                      children: state.localFiles!.map((file) {
                                        final fileName = file.path
                                            .split('/')
                                            .last;

                                        return Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            color: Colors.grey.shade100,
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.insert_drive_file,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 8),

                                              /// Tên file
                                              Expanded(
                                                child: Text(
                                                  fileName,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),

                                              /// Nút xoá
                                              GestureDetector(
                                                onTap: () {
                                                  bloc.add(
                                                    MarketingEvent.removeLocalFile(
                                                      file,
                                                    ),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  size: 20,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: FormActions(
                        mode: FormActionMode.add,
                        onSubmit: () async {
                          FocusScope.of(context).unfocus();

                          final formState = _formKey.currentState;
                          if (formState == null) return;

                          final isValid = formState.saveAndValidate();
                          if (!isValid) return;

                          final values = formState.value;

                          final error = ValidateHelper.validateMarketingReport(
                            date: values['marketing_add_date'] as DateTime?,
                            content: state.content ?? '',
                            result: state.results ?? '',
                            planNextDay: state.planNextDay ?? '',
                          );

                          if (error != null) {
                            showMessage(
                              context,
                              error,
                              type: SnackBarType.error,
                            );
                            return;
                          }

                          final pickedDate =
                              values['marketing_add_date'] as DateTime?;

                          if (pickedDate == null) return;

                          final currentState = context
                              .read<MarketingBloc>()
                              .state;

                          /// 1️⃣ Nếu có localFiles thì upload trước
                          if (currentState.localFiles?.isNotEmpty ?? false) {
                            bloc.add(
                              MarketingEvent.uploadFiles(
                                currentState.localFiles!,
                              ),
                            );

                            /// chờ upload xong
                            await bloc.stream.firstWhere(
                              (s) => !s.isUploadingFile,
                            );

                            final newState = bloc.state;

                            if (!newState.uploadSuccess) {
                              return;
                            }
                          }

                          /// 2️⃣ Sau khi upload xong mới submit
                          bloc.add(MarketingEvent.submitReport(pickedDate));
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        BlocBuilder<MarketingBloc, MarketingState>(
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
