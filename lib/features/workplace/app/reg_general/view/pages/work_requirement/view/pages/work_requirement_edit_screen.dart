import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../common/extensions/index.dart';
import '../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../../di/injection.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../../data/datasource/models/work_requirement_model.dart';
import '../bloc/work_requirement_bloc.dart';
import '../widgets/work_requirement_attachment_card.dart';
import '../widgets/work_requirement_detail_section.dart';
import '../widgets/work_requirement_info_card.dart';

class WorkRequirementEditScreen extends StatefulWidget {
  const WorkRequirementEditScreen({
    super.key,
    int? itemId,
    WorkRequirementItem? item,
  }) : item = item ?? null,
       itemId = itemId ?? 0;

  final WorkRequirementItem? item;
  final int? itemId;

  @override
  State<WorkRequirementEditScreen> createState() =>
      _WorkRequirementEditScreenState();
}

class _WorkRequirementEditScreenState
    extends
        BaseState<
          WorkRequirementEditScreen,
          WorkRequirementEvent,
          WorkRequirementState,
          WorkRequirementBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();
  DateTime? _prevDeadline;
  final Set<int> _expandedDetails = {0, 1, 2, 3, 4, 5, 6, 7};

  static const List<WorkRequirementDetailMeta> _detailMetas = [
    WorkRequirementDetailMeta(
      index: 0,
      title: 'Nội dung yêu cầu',
      icon: Icons.description_outlined,
    ),
    WorkRequirementDetailMeta(
      index: 1,
      title: 'Người yêu cầu',
      icon: Icons.person_outline,
    ),
    WorkRequirementDetailMeta(
      index: 2,
      title: 'Lý do',
      icon: Icons.help_outline,
    ),
    WorkRequirementDetailMeta(index: 3, title: 'Số lượng', icon: Icons.tag),
    WorkRequirementDetailMeta(
      index: 4,
      title: 'Đơn vị tính',
      icon: Icons.straighten,
    ),
    WorkRequirementDetailMeta(
      index: 5,
      title: 'Chất lượng',
      icon: Icons.verified_outlined,
    ),
    WorkRequirementDetailMeta(
      index: 6,
      title: 'Địa điểm',
      icon: Icons.location_on_outlined,
    ),
    WorkRequirementDetailMeta(
      index: 7,
      title: 'Thời gian hoàn thành đề nghị',
      icon: Icons.schedule,
    ),
  ];

  @override
  Widget renderUI(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<WorkRequirementBloc>(),
      child: _EditContent(
        formKey: _formKey,
        item: widget.item,
        itemId: widget.item?.id ?? widget.itemId,
        expandedDetails: _expandedDetails,
        detailMetas: _detailMetas,
        prevDeadline: _prevDeadline,
      ),
    );
  }
}

class _EditContent extends StatefulWidget {
  const _EditContent({
    required this.formKey,
    required this.item,
    required this.itemId,
    required this.expandedDetails,
    required this.detailMetas,
    required this.prevDeadline,
  });

  final GlobalKey<FormBuilderState> formKey;
  final WorkRequirementItem? item;
  final int? itemId;
  final Set<int> expandedDetails;
  final List<WorkRequirementDetailMeta> detailMetas;
  final DateTime? prevDeadline;

  @override
  State<_EditContent> createState() => _EditContentState();
}

class _EditContentState extends State<_EditContent> {
  late DateTime? _prevDeadline;
  bool _initEditLoaded = false;
  bool _detailRowsLoaded = false;

  @override
  void initState() {
    super.initState();
    _prevDeadline = widget.prevDeadline;
    context.read<WorkRequirementBloc>()
      .add(WorkRequirementEvent.initEdit(
        id: widget.itemId ?? 0,
        item: widget.item!,
      ));
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();
    final formState = widget.formKey.currentState;
    if (formState == null || !formState.saveAndValidate()) return;

    final values = formState.value;
    final dateRequest = values['date_request'] as DateTime?;
    final deadline = values['deadline'] as DateTime?;

    if (dateRequest == null) {
      context.showMessage('Vui lòng chọn ngày yêu cầu', type:SnackBarType.error);
      return;
    }
    if (deadline == null) {
      context.showMessage('Vui lòng chọn thời gian hoàn thành', type:SnackBarType.error);
      return;
    }

    final bloc = context.read<WorkRequirementBloc>();
    final state = bloc.state;

    if (state.requiredDepartmentId == null) {
      context.showMessage('Vui lòng chọn bộ phận được yêu cầu', type:SnackBarType.error);
      return;
    }
    if (state.approverDisplayName.isNullOrEmpty) {
      context.showMessage('Vui lòng chọn TBP duyệt', type:SnackBarType.error);
      return;
    }

    final details = <WorkRequirementDetailResponse>[];
    for (var i = 0; i < widget.detailMetas.length; i++) {
      final rowData = state.detailValues[i] ?? {};
      final explanation = rowData['explanation'] ?? '';
      final target = rowData['target'] ?? '';
      final note = rowData['note'];

      if (i == 7) {
        details.add(WorkRequirementDetailResponse(
          id: int.tryParse(rowData['id'] ?? ''),
          stt: i + 1,
          category: widget.detailMetas[i].title,
          description: DateFormat('dd/MM/yyyy').format(deadline),
          target: target,
          note: note,
        ));
      } else {
        details.add(WorkRequirementDetailResponse(
          id: int.tryParse(rowData['id'] ?? ''),
          stt: i + 1,
          category: widget.detailMetas[i].title,
          description: explanation,
          target: target,
          note: note,
        ));
      }
    }

    final editItem = widget.item;
    if (editItem == null) return;

    bloc.add(WorkRequirementEvent.editSubmit(
      id: editItem.id ?? 0,
      approvedTBPId: state.approvedTBPId ?? 0,
      dateRequest: dateRequest,
      deadlineRequest: deadline,
      requiredDepartmentId: state.requiredDepartmentId!,
      coordinationDepartmentId: state.coordinationDepartmentId,
      details: details,
      numberRequest: editItem.numberRequest ?? '',
    ));
  }

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null && result.files.isNotEmpty) {
      final dateReq =
          widget.formKey.currentState?.value['date_request'] ?? DateTime.now();
      final files = <File>[];
      for (final file in result.files) {
        if (file.path != null) {
          files.add(File(file.path!));
        }
      }
      if (files.isNotEmpty) {
        context.read<WorkRequirementBloc>()
          ..add(WorkRequirementEvent.setLocalFiles(files))
          ..add(WorkRequirementEvent.uploadFiles(
            files: files,
            dateRequest: dateReq,
          ));
      }
    }
  }

  Future<void> _openRequiredDepartmentSheet() async {
    FocusScope.of(context).unfocus();
    final form = widget.formKey.currentState;
    if (form == null) return;

    final items = context.read<WorkRequirementBloc>().state.departments;
    if (items.isEmpty) {
      context.showMessage('Chưa có bộ phận', type:SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<DepartResponse>(
      context: context,
      title: 'Chọn bộ phận được yêu cầu',
      items: items,
      onSelected: (item) {
        form.fields['required_department']?.didChange(item.name);
        context.read<WorkRequirementBloc>()
          .add(WorkRequirementEvent.changeRequiredDepartment(
            id: item.id,
            name: item.name,
          ));
      },
      displayText: (item) => item.name,
    );
  }

  Future<void> _openCoordinationDepartmentSheet() async {
    FocusScope.of(context).unfocus();
    final form = widget.formKey.currentState;
    if (form == null) return;

    final items = context.read<WorkRequirementBloc>().state.departments;
    if (items.isEmpty) {
      context.showMessage('Chưa có bộ phận', type:SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<DepartResponse>(
      context: context,
      title: 'Chọn bộ phận phối hợp',
      items: items,
      onSelected: (item) {
        form.fields['coordination_department']?.didChange(item.name);
        context.read<WorkRequirementBloc>()
          .add(WorkRequirementEvent.changeCoordinationDepartment(
            id: item.id,
            name: item.name,
          ));
      },
      displayText: (item) => item.name,
    );
  }

  Future<void> _openApproverSheet() async {
    FocusScope.of(context).unfocus();
    final form = widget.formKey.currentState;
    if (form == null) return;

    final items = context.read<WorkRequirementBloc>().state.approvers;
    if (items.isEmpty) {
      context.showMessage('Chưa có người kiểm duyệt', type:SnackBarType.error);
      return;
    }

    await openSelectBottomSheetGrouped<WorkRequirementApproverItem>(
      context: context,
      title: 'Chọn TBP duyệt',
      items: items,
      groupBy: (item) => item.departmentName ?? 'Khác',
      onSelected: (item) {
        final displayName =
            '${item.code ?? ''} - ${item.fullName ?? ''}'.trim();
        form.fields['approver']?.didChange(displayName);
        context.read<WorkRequirementBloc>()
          .add(WorkRequirementEvent.changeApprover(
            id: item.employeeId,
            displayName: displayName,
          ));
      },
      displayText: (item) {
        final code = item.code ?? '';
        final name = item.fullName ?? '';
        return '$code - $name'.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkRequirementBloc, WorkRequirementState>(
      listenWhen: (prev, curr) =>
          prev.submitSuccess != curr.submitSuccess ||
          prev.status != curr.status ||
          prev.message != curr.message ||
          prev.deadlineRequest != curr.deadlineRequest ||
          prev.detailValues != curr.detailValues,
      listener: (ctx, state) {
        if (state.submitSuccess) {
          context.showMessage('Cập nhật yêu cầu công việc thành công',
              type:SnackBarType.success);
          ctx.pop(true);
          return;
        }
        if (state.status == BaseStateStatus.failed &&
            state.message != null) {
          context.showMessage(state.message!, type:SnackBarType.error);
        }
        // Sau khi dropdowns load xong, set giá trị vào form
        if (!_initEditLoaded &&
            !state.isDetailLoading &&
            state.requiredDepartmentName != null) {
          _initEditLoaded = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            final formState = widget.formKey.currentState;
            if (formState == null) return;
            formState.fields['approver']?.didChange(state.approverDisplayName);
            formState.fields['required_department']?.didChange(state.requiredDepartmentName);
            formState.fields['coordination_department']?.didChange(state.coordinationDepartmentName);
          });
        }
        // Sau khi detail rows load xong, set giá trị vào form
        if (!_detailRowsLoaded &&
            !state.isDetailLoading &&
            state.detailValues.isNotEmpty) {
          _detailRowsLoaded = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            for (var i = 0; i < state.detailValues.length; i++) {
              final rowData = state.detailValues[i] ?? {};
              final exp = rowData['explanation'] ?? '';
              final tgt = rowData['target'] ?? '';
              final note = rowData['note'];
              if (exp.isNotEmpty || tgt.isNotEmpty || (note?.isNotEmpty ?? false)) {
                context.read<WorkRequirementBloc>()
                    .add(WorkRequirementEvent.updateFormField(
                  rowIndex: i,
                  field: 'explanation',
                  value: exp,
                ));
              }
              if (tgt.isNotEmpty) {
                context.read<WorkRequirementBloc>()
                    .add(WorkRequirementEvent.updateFormField(
                  rowIndex: i,
                  field: 'target',
                  value: tgt,
                ));
              }
              if (note?.isNotEmpty == true) {
                context.read<WorkRequirementBloc>()
                    .add(WorkRequirementEvent.updateFormField(
                  rowIndex: i,
                  field: 'note',
                  value: note ?? '',
                ));
              }
            }
          });
        }
        if (state.deadlineRequest != null &&
            _prevDeadline != state.deadlineRequest) {
          _prevDeadline = state.deadlineRequest;
          context.read<WorkRequirementBloc>()
            .add(WorkRequirementEvent.updateFormField(
              rowIndex: 7,
              field: 'explanation',
              value: DateFormat('dd/MM/yyyy').format(state.deadlineRequest!),
            ));
        }
      },
      builder: (ctx, state) {
        if (state.isDetailLoading) {
          return Scaffold(
            appBar: AppBarCommon(
              title: const Text('Chỉnh sửa yêu cầu'),
              onBackTap: () => ctx.pop(),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        return Stack(
          children: [
            BaseScaffold(
              appBar: AppBarCommon(
                title: const Text('Chỉnh sửa yêu cầu'),
                onBackTap: () => ctx.pop(),
              ),
              body: BlocBuilder<WorkRequirementBloc, WorkRequirementState>(
                buildWhen: (prev, curr) =>
                    prev.isDetailLoading != curr.isDetailLoading ||
                    prev.departments != curr.departments ||
                    prev.approvers != curr.approvers ||
                    prev.dateRequest != curr.dateRequest ||
                    prev.deadlineRequest != curr.deadlineRequest ||
                    prev.detailValues != curr.detailValues ||
                    prev.files != curr.files ||
                    prev.localFiles != curr.localFiles ||
                    prev.isUploadingFile != curr.isUploadingFile ||
                    prev.requiredDepartmentId != curr.requiredDepartmentId ||
                    prev.requiredDepartmentName != curr.requiredDepartmentName ||
                    prev.coordinationDepartmentId != curr.coordinationDepartmentId ||
                    prev.coordinationDepartmentName != curr.coordinationDepartmentName ||
                    prev.approvedTBPId != curr.approvedTBPId ||
                    prev.approverDisplayName != curr.approverDisplayName,
                builder: (context, state) {
                  return FormBuilder(
                    key: widget.formKey,
                    onChanged: () => setState(() {}),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(16),
                            children: [
                              WorkRequirementInfoCard(
                                state: state,
                                onDateRequestChanged: (date) {
                                  context.read<WorkRequirementBloc>()
                                    .add(WorkRequirementEvent.changeDateRequest(date));
                                },
                                onDeadlineChanged: (date) {
                                  context.read<WorkRequirementBloc>()
                                    .add(WorkRequirementEvent.changeDeadline(date));
                                  if (date != null) {
                                    context.read<WorkRequirementBloc>()
                                      .add(WorkRequirementEvent.updateFormField(
                                        rowIndex: 7,
                                        field: 'explanation',
                                        value: DateFormat('dd/MM/yyyy').format(date),
                                      ));
                                  }
                                },
                                onOpenRequiredDept: _openRequiredDepartmentSheet,
                                onOpenCoordinationDept:
                                    _openCoordinationDepartmentSheet,
                                onOpenApprover: _openApproverSheet,
                              ),
                              const SizedBox(height: 16),
                              _buildDetailsSection(state),
                              const SizedBox(height: 16),
                              WorkRequirementAttachmentCard(
                                uploadedFiles: state.files,
                                localFiles: state.localFiles,
                                isUploading: state.isUploadingFile,
                                onPickFiles: _pickFiles,
                                onRemoveUploadedFile: (fileId) {
                                  final bloc = context.read<WorkRequirementBloc>();
                                  if (fileId == 0) {
                                    // File moi upload trong session nay: xoa khoi files
                                    final updated = state.files
                                        .where((f) => f.id != 0)
                                        .toList();
                                    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                                    bloc.emit(bloc.state.copyWith(files: updated));
                                  } else {
                                    // File cu da ton tai: danh dau xoa bang ID
                                    bloc.add(WorkRequirementEvent.markDeletedFile(fileId as int));
                                  }
                                },
                                onRemoveLocalFile: (file) {
                                  context.read<WorkRequirementBloc>()
                                    .add(WorkRequirementEvent.removeLocalFile(file));
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: FormActions(
                            mode: FormActionMode.edit,
                            onSave: _onSubmit,
                            onCancel: () => ctx.pop(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<WorkRequirementBloc, WorkRequirementState>(
              buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
              builder: (ctx, state) {
                if (!state.isSubmitting) return const SizedBox.shrink();
                return Positioned.fill(
                  child: AbsorbPointer(
                    absorbing: true,
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.45),
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
      },
    );
  }

  //---(_Screen)---//
  Widget _buildDetailsSection(WorkRequirementState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            'Đề mục yêu cầu',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.heading,
            ),
          ),
        ),
        ...List.generate(widget.detailMetas.length, (i) {
          final meta = widget.detailMetas[i];
          final rowData = state.detailValues[i] ?? {};
          final hasData =
              rowData['explanation']?.isNotEmpty == true ||
              rowData['target']?.isNotEmpty == true ||
              rowData['note']?.isNotEmpty == true;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WorkRequirementDetailAccordion(
              formKey: widget.formKey,
              meta: meta,
              rowIndex: i,
              isExpanded: widget.expandedDetails.contains(i),
              hasData: hasData,
              isAutoFill: i == 7,
              autoValue: i == 7 && state.deadlineRequest != null
                  ? DateFormat('dd/MM/yyyy').format(state.deadlineRequest!)
                  : '',
              initialExplanation: rowData['explanation'] ?? '',
              initialTarget: rowData['target'] ?? '',
              initialNote: rowData['note'],
              onToggle: () {
                setState(() {
                  if (widget.expandedDetails.contains(i)) {
                    widget.expandedDetails.remove(i);
                  } else {
                    widget.expandedDetails.add(i);
                  }
                });
              },
              onExplanationChanged: (v) {
                context.read<WorkRequirementBloc>()
                  .add(WorkRequirementEvent.updateFormField(
                    rowIndex: i,
                    field: 'explanation',
                    value: v,
                  ));
              },
              onTargetChanged: (v) {
                context.read<WorkRequirementBloc>()
                  .add(WorkRequirementEvent.updateFormField(
                    rowIndex: i,
                    field: 'target',
                    value: v,
                  ));
              },
              onNoteChanged: (v) {
                context.read<WorkRequirementBloc>()
                  .add(WorkRequirementEvent.updateFormField(
                    rowIndex: i,
                    field: 'note',
                    value: v,
                  ));
              },
            ),
          );
        }),
      ],
    );
  }
}
