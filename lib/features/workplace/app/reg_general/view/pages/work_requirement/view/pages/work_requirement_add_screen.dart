import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../../common/enums/index.dart';
import '../../../../../../../../../../common/extensions/index.dart';
import '../../../../../../../../../../common/helpers/select_bottom_sheet_helper.dart';
import '../../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../reports/data/datasource/models/report_model.dart';
import '../../data/datasource/models/work_requirement_model.dart';
import '../bloc/work_requirement_bloc.dart';
import '../widgets/work_requirement_attachment_card.dart';
import '../widgets/work_requirement_detail_section.dart';
import '../widgets/work_requirement_info_card.dart';

class WorkRequirementAddScreen extends StatefulWidget {
  const WorkRequirementAddScreen({super.key});

  @override
  State<WorkRequirementAddScreen> createState() =>
      _WorkRequirementAddScreenState();
}

class _WorkRequirementAddScreenState
    extends
        BaseState<
          WorkRequirementAddScreen,
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
  void initState() {
    super.initState();
    _prevDeadline = null;
    bloc.add(const WorkRequirementEvent.initAdd());
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();

    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    final dateRequest = values['date_request'] as DateTime?;
    final deadline = values['deadline'] as DateTime?;

    if (dateRequest == null) {
      showMessage(
        context,
        'Vui lòng chọn ngày yêu cầu',
        type: SnackBarType.error,
      );
      return;
    }
    if (deadline == null) {
      showMessage(
        context,
        'Vui lòng chọn thời gian hoàn thành',
        type: SnackBarType.error,
      );
      return;
    }
    final requiredDeptId = bloc.state.requiredDepartmentId;
    if (requiredDeptId == null) {
      showMessage(
        context,
        'Vui lòng chọn bộ phận được yêu cầu',
        type: SnackBarType.error,
      );
      return;
    }
    final approverId = bloc.state.approvedTBPId ?? 0;
    if (bloc.state.approverDisplayName.isNullOrEmpty) {
      showMessage(context, 'Vui lòng chọn TBP duyệt', type: SnackBarType.error);
      return;
    }

    // Doc tu state.detailValues thay vi form values
    final details = <WorkRequirementDetailResponse>[];
    for (var i = 0; i < _detailMetas.length; i++) {
      final rowData = bloc.state.detailValues[i] ?? {};
      final explanation = rowData['explanation'] ?? '';
      final target = rowData['target'] ?? '';
      final note = rowData['note'];

      if (i == 7) {
        details.add(
          WorkRequirementDetailResponse(
            stt: i + 1,
            category: _detailMetas[i].title,
            description: DateFormat('dd/MM/yyyy').format(deadline),
            target: target,
            note: note,
          ),
        );
      } else {
        details.add(
          WorkRequirementDetailResponse(
            stt: i + 1,
            category: _detailMetas[i].title,
            description: explanation,
            target: target,
            note: note,
          ),
        );
      }
    }

    bloc.add(
      WorkRequirementEvent.submit(
        approvedTBPId: approverId,
        dateRequest: dateRequest,
        deadlineRequest: deadline,
        requiredDepartmentId: requiredDeptId,
        coordinationDepartmentId: bloc.state.coordinationDepartmentId,
        details: details,
      ),
    );
  }

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null && result.files.isNotEmpty) {
      final names = result.files.map((f) => f.name).toList();
      bloc.add(WorkRequirementEvent.changeAttachments(names));
    }
  }

  Future<void> _openRequiredDepartmentSheet() async {
    FocusScope.of(context).unfocus();
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.departments;
    if (items.isEmpty) {
      showMessage(context, 'Chưa có bộ phận', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<DepartResponse>(
      context: context,
      title: 'Chọn bộ phận được yêu cầu',
      items: items,
      onSelected: (item) {
        form.fields['required_department']?.didChange(item.name);
        bloc.add(WorkRequirementEvent.changeRequiredDepartment(
          id: item.id,
          name: item.name,
        ));
      },
      displayText: (item) => item.name,
    );
  }

  Future<void> _openCoordinationDepartmentSheet() async {
    FocusScope.of(context).unfocus();
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.departments;
    if (items.isEmpty) {
      showMessage(context, 'Chưa có bộ phận', type: SnackBarType.error);
      return;
    }

    await openSelectBottomSheet<DepartResponse>(
      context: context,
      title: 'Chọn bộ phận phối hợp',
      items: items,
      onSelected: (item) {
        form.fields['coordination_department']?.didChange(item.name);
        bloc.add(WorkRequirementEvent.changeCoordinationDepartment(
          id: item.id,
          name: item.name,
        ));
      },
      displayText: (item) => item.name,
    );
  }

  Future<void> _openApproverSheet() async {
    FocusScope.of(context).unfocus();
    final form = _formKey.currentState;
    if (form == null) return;

    final items = bloc.state.approvers;
    if (items.isEmpty) {
      showMessage(context, 'Chưa có người kiểm duyệt',
          type: SnackBarType.error);
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
        bloc.add(WorkRequirementEvent.changeApprover(
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
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<WorkRequirementBloc, WorkRequirementState>(
          listenWhen: (prev, curr) =>
              prev.submitSuccess != curr.submitSuccess ||
              prev.status != curr.status ||
              prev.message != curr.message ||
              prev.deadlineRequest != curr.deadlineRequest,
          listener: (context, state) {
            if (state.submitSuccess) {
              showMessage(
                context,
                'Đã tạo yêu cầu công việc thành công',
                type: SnackBarType.success,
              );
              context.pop(true);
              return;
            }
            if (state.status == BaseStateStatus.failed &&
                state.message != null) {
              showMessage(context, state.message!, type: SnackBarType.error);
            }
            if (state.deadlineRequest != null &&
                _prevDeadline != state.deadlineRequest) {
              _prevDeadline = state.deadlineRequest;
              bloc.add(
                WorkRequirementEvent.updateFormField(
                  rowIndex: 7,
                  field: 'explanation',
                  value: DateFormat('dd/MM/yyyy').format(state.deadlineRequest!),
                ),
              );
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(
              title: const Text('Tạo yêu cầu công việc'),
              onBackTap: () => context.pop(),
            ),
            body: BlocBuilder<WorkRequirementBloc, WorkRequirementState>(
              buildWhen: (prev, curr) =>
                  prev.departments != curr.departments ||
                  prev.approvers != curr.approvers ||
                  prev.dateRequest != curr.dateRequest ||
                  prev.deadlineRequest != curr.deadlineRequest ||
                  prev.detailValues != curr.detailValues ||
                  prev.attachmentNames != curr.attachmentNames ||
                  prev.requiredDepartmentId != curr.requiredDepartmentId ||
                  prev.requiredDepartmentName != curr.requiredDepartmentName ||
                  prev.coordinationDepartmentId != curr.coordinationDepartmentId ||
                  prev.coordinationDepartmentName != curr.coordinationDepartmentName ||
                  prev.approvedTBPId != curr.approvedTBPId ||
                  prev.approverDisplayName != curr.approverDisplayName,
              builder: (context, state) {
                return FormBuilder(
                  key: _formKey,
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
                                bloc.add(
                                  WorkRequirementEvent.changeDateRequest(date),
                                );
                              },
                              onDeadlineChanged: (date) {
                                bloc.add(
                                  WorkRequirementEvent.changeDeadline(date),
                                );
                                if (date != null) {
                                  bloc.add(
                                    WorkRequirementEvent.updateFormField(
                                      rowIndex: 7,
                                      field: 'explanation',
                                      value: DateFormat(
                                        'dd/MM/yyyy',
                                      ).format(date),
                                    ),
                                  );
                                }
                              },
                              onOpenRequiredDept: _openRequiredDepartmentSheet,
                              onOpenCoordinationDept: _openCoordinationDepartmentSheet,
                              onOpenApprover: _openApproverSheet,
                            ),
                            const SizedBox(height: 16),
                            _buildDetailsSection(state),
                            const SizedBox(height: 16),
                            WorkRequirementAttachmentCard(
                              attachmentNames: state.attachmentNames,
                              onPickFiles: _pickFiles,
                              onRemoveFile: (name) {
                                final updated = state.attachmentNames
                                    .where((n) => n != name)
                                    .toList();
                                bloc.add(
                                  WorkRequirementEvent.changeAttachments(
                                    updated,
                                  ),
                                );
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
                          mode: FormActionMode.add,
                          onSubmit: _onSubmit,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        BlocBuilder<WorkRequirementBloc, WorkRequirementState>(
          buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
          builder: (context, state) {
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
  }

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
        ...List.generate(_detailMetas.length, (i) {
          final meta = _detailMetas[i];
          final rowData = state.detailValues[i] ?? {};
          final hasData =
              rowData['explanation']?.isNotEmpty == true ||
              rowData['target']?.isNotEmpty == true ||
              rowData['note']?.isNotEmpty == true;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WorkRequirementDetailAccordion(
              formKey: _formKey,
              meta: meta,
              rowIndex: i,
              isExpanded: _expandedDetails.contains(i),
              hasData: hasData,
              isAutoFill: i == 7,
              autoValue: i == 7 && state.deadlineRequest != null
                  ? DateFormat(
                      'dd/MM/yyyy',
                    ).format(state.deadlineRequest!)
                  : '',
              initialExplanation: rowData['explanation'] ?? '',
              initialTarget: rowData['target'] ?? '',
              initialNote: rowData['note'],
              onToggle: () {
                setState(() {
                  if (_expandedDetails.contains(i)) {
                    _expandedDetails.remove(i);
                  } else {
                    _expandedDetails.add(i);
                  }
                });
              },
              onExplanationChanged: (v) {
                bloc.add(
                  WorkRequirementEvent.updateFormField(
                    rowIndex: i,
                    field: 'explanation',
                    value: v,
                  ),
                );
              },
              onTargetChanged: (v) {
                bloc.add(
                  WorkRequirementEvent.updateFormField(
                    rowIndex: i,
                    field: 'target',
                    value: v,
                  ),
                );
              },
              onNoteChanged: (v) {
                bloc.add(
                  WorkRequirementEvent.updateFormField(
                    rowIndex: i,
                    field: 'note',
                    value: v,
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
