import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/marketing_bloc.dart';

class MarketingEditScreen extends StatefulWidget {
  final int dailyId;

  const MarketingEditScreen({
    super.key,
    required this.dailyId,
  });

  @override
  State<MarketingEditScreen> createState() =>
      _MarketingEditScreenState();
}

class _MarketingEditScreenState
    extends BaseState<
        MarketingEditScreen,
        MarketingEvent,
        MarketingState,
        MarketingBloc> {

  final _formKey = GlobalKey<FormBuilderState>();

  final _contentController = TextEditingController();
  final _resultController = TextEditingController();
  final _planController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.add(
      MarketingEvent.selectReport(dailyID: widget.dailyId),
    );
  }

  @override
  void dispose() {
    _contentController.dispose();
    _resultController.dispose();
    _planController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Chỉnh sửa báo cáo'),
            onBackTap: () => context.pop(),
          ),
          body: BlocListener<MarketingBloc, MarketingState>(
            listenWhen: (p, c) =>
            p.detailReport != c.detailReport || p.saveSuccess != c.saveSuccess,
            listener: (context, state) {
              /// SAVE SUCCESS -> POP TRUE
              if (state.saveSuccess) {
                context.pop(true);
              }

              final detail = state.detailReport?.dailyData;
              if (detail == null) return;

              _contentController.text = detail.content ?? '';
              _resultController.text = detail.results ?? '';
              _planController.text = detail.planNextDay ?? '';
              _noteController.text = detail.note ?? '';


            },
            child: BlocBuilder<MarketingBloc, MarketingState>(
              builder: (context, state) {
                if (state.isLoadingDetail) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final detail = state.detailReport?.dailyData;
                if (detail == null) {
                  return const Center(
                    child: Text('Không có dữ liệu'),
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: FormBuilder(
                        key: _formKey,
                        initialValue: {
                          'date': DateTime.tryParse(
                              detail.dateReport ?? '') ??
                              DateTime.now(),
                        },
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [

                            /// ===== DATE =====
                            FormCard(
                              child: FormDateTimePicker(
                                icon: Icons.calendar_today,
                                nameForm: 'marketing_edit_date',
                                nameTimePicker: 'date_time',
                                label: 'Ngày báo cáo',
                                inputType: InputType.date,
                                format:
                                DateFormat('dd/MM/yyyy'),
                                initialValue: DateTime.tryParse(
                                    detail.dateReport ?? ''),
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// CONTENT
                            FormCard(
                              title: 'Nội dung công việc',
                              child: FormInputField(
                                icon: Icons.note_alt_outlined,
                                nameForm:
                                'marketing_edit_content',
                                nameTextField: 'content',
                                label: 'Nội dung công việc',
                                maxLines: 4,
                                controller:
                                _contentController,
                                onChanged: (v) {
                                  bloc.add(
                                    MarketingEvent.updateWork(
                                      content: v,
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// RESULT
                            FormCard(
                              title: 'Kết quả',
                              child: FormInputField(
                                icon: Icons.task_alt_outlined,
                                nameForm:
                                'marketing_edit_result',
                                nameTextField: 'result',
                                label: 'Kết quả đạt được',
                                maxLines: 4,
                                controller:
                                _resultController,
                                onChanged: (v) {
                                  bloc.add(
                                    MarketingEvent.updateWork(
                                      results: v,
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// NEXT PLAN
                            FormCard(
                              title:
                              'Kế hoạch ngày tiếp theo',
                              child: FormInputField(
                                icon:
                                Icons.next_plan_outlined,
                                nameForm:
                                'marketing_edit_next_plan',
                                nameTextField:
                                'next_plan',
                                label:
                                'Kế hoạch ngày tiếp theo',
                                maxLines: 3,
                                controller:
                                _planController,
                                onChanged: (v) {
                                  bloc.add(
                                    MarketingEvent.updateWork(
                                      planNextDay: v,
                                    ),
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 8),

                            /// NOTE
                            FormCard(
                              title:
                              'Đề xuất cải tiến',
                              child: FormInputField(
                                icon:
                                Icons.lightbulb_outline,
                                nameForm:
                                'marketing_edit_note',
                                nameTextField:
                                'note',
                                label:
                                'Đề xuất cải tiến',
                                maxLines: 4,
                                controller:
                                _noteController,
                                onChanged: (v) {
                                  bloc.add(
                                    MarketingEvent.updateWork(
                                      note: v,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 8),

                            /// FILE ĐÍNH KÈM
                            FormCard(
                              title: 'File đính kèm',
                              child: Builder(
                                builder: (context) {
                                  final serverFiles = state.marketingDailyFiles ?? [];
                                  final deletedIds = state.deletedFileIds ?? [];
                                  final newFiles = state.files ?? [];
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      /// FILE CŨ (SERVER)
                                      ...serverFiles
                                          .where((e) => !deletedIds.contains(e.id))
                                          .map(
                                            (e) => FileItemWidget(
                                          fileName: e.fileName,
                                          onDelete: () {

                                              bloc.add(
                                                MarketingEvent.markDeletedFile(e.id),
                                              );
                                          },
                                        ),
                                      ),

                                      /// FILE MỚI (LOCAL)
                                      ...newFiles.map(
                                            (file) => FileItemWidget(
                                          fileName: file.fileNameOrigin,
                                          onDelete: () {
                                            bloc.add(
                                              MarketingEvent.removeFile(file),
                                            );
                                          },
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      /// PICK FILE
                                      FormFilePicker(
                                        name: 'edit_files',
                                        label: 'Chọn file',
                                        icon: Icons.attach_file,
                                        allowMultiple: true,
                                        onChanged: (files) {
                                          final validFiles = files
                                              .where((e) => e.path != null)
                                              .map((e) => File(e.path!))
                                              .toList();

                                          /// BẮT BUỘC: set local trước
                                          bloc.add(
                                            MarketingEvent.setLocalFiles(validFiles),
                                          );

                                          /// Sau đó upload
                                          bloc.add(
                                            MarketingEvent.uploadEditFiles(validFiles),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: FormActions(
                        mode: FormActionMode.edit,
                        onCancel: () =>
                            context.pop(),
                        onSave: () async {
                          FocusScope.of(context).unfocus();

                          final formState = _formKey.currentState;
                          if (formState == null) return;

                          final isValid = formState.saveAndValidate();
                          if (!isValid) return;

                          final values = formState.value;

                          final pickedDate =
                          values['marketing_edit_date'] as DateTime?;

                          if (pickedDate == null) return;

                          /// VALIDATE BUSINESS
                          final error = ValidateHelper.validateMarketingReport(
                            date: pickedDate,
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

                          /// Nếu có file đang upload thì chặn
                          if (state.isUploadingFile) {
                            showMessage(
                              context,
                              'Đang upload file, vui lòng chờ',
                              type: SnackBarType.info,
                            );
                            return;
                          }

                          bloc.add(
                            MarketingEvent.submitEditReport(
                              pickedDate,
                              widget.dailyId,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),

        /// LOADING SAVE
        BlocBuilder<MarketingBloc, MarketingState>(
          buildWhen: (p, c) =>
          p.isSaving != c.isSaving,
          builder: (context, state) {
            if (!state.isSaving) {
              return const SizedBox.shrink();
            }

            return Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Colors.black
                      .withOpacity(0.45),
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/lotties/Loading.json',
                    width: 240,
                    height: 240,
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

class FileItemWidget extends StatelessWidget {
  final String fileName;
  final VoidCallback? onDelete;

  const FileItemWidget({
    super.key,
    required this.fileName,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              fileName,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (onDelete != null)
            IconButton(
              icon: const Icon(
                Icons.close,
                size: 18,
                color: Colors.red,
              ),
              onPressed: onDelete,
            ),
        ],
      ),
    );
  }
}