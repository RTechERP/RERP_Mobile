import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../../../data/datasource/models/report_model.dart';
import '../bloc/tech_bloc.dart';

class TechDetailScreen extends StatefulWidget {
  const TechDetailScreen({super.key});

  @override
  State<TechDetailScreen> createState() => _TechDetailScreenState();
}

class _TechDetailScreenState
    extends BaseState<TechDetailScreen, TechEvent, TechState, TechBloc> {
  bool _isEdit = false;
  bool _showExtraInfo = false;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget renderUI(BuildContext context) {
    final r = GoRouterState.of(context).extra as ReportResponse?;

    if (r == null) {
      return const Center(child: Text('Thiếu dữ liệu báo cáo'));
    }

    return BaseScaffold(
      appBar: AppBarCommon(
        title: Text(_isEdit ? 'Chỉnh sửa báo cáo' : 'Chi tiết báo cáo'),
        actions: [
          IconButton(
            icon: Icon(_isEdit ? Icons.visibility : Icons.edit),
            onPressed: () => setState(() => _isEdit = !_isEdit),
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ===== Ngày =====
            FormInputField(
              nameForm: 'tech_detail_dateReport',
              nameTextField: 'dateReport',
              icon: Icons.calendar_today,
              label: 'Ngày',
              readOnly: true,
              initialValue: DateFormat(
                'dd/MM/yyyy',
              ).format(r.createdDate ?? DateTime.now()),
            ),

            SizedBox(height: 12),
            // ===== Dự án =====
            FormInputField(
              nameForm: 'tech_detail_project',
              nameTextField: 'project',
              icon: Icons.work_outline,
              label: 'Dự án',
              readOnly: !_isEdit,
              initialValue: r.projectText,
            ),
            SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm: 'tech_detail_total',
                    nameTextField: 'total',
                    label: 'Tổng giờ',
                    keyboardType: TextInputType.number,
                    initialValue: r.totalHours.toString(),
                    readOnly: !_isEdit,
                    validator: (v) {
                      final total = double.tryParse(v ?? '') ?? 0;
                      final ot = r.totalHourOT ?? 0;

                      if (total <= 0) return 'Giờ phải > 0';
                      if (total > 24) return 'Giờ không được > 24';
                      if (total - ot <= 0) return 'Giờ hành chính phải > 0';
                      return null;
                    },


                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FormInputField(
                    icon: Icons.timer_outlined,
                    nameForm: 'tech_detail_ot',
                    nameTextField: 'ot',
                    label: 'OT',
                    keyboardType: TextInputType.number,
                    initialValue: r.totalHourOT?.toString() ?? '0',
                    readOnly: !_isEdit,
                    validator: (v) {
                      final total = r.totalHours;
                      final ot = double.tryParse(v ?? '') ?? 0;

                      if (ot > total) return 'OT không được > Tổng giờ';
                      if (total > 8 && ot <= 0) return 'Tổng giờ > 8 thì phải có OT';
                      if (total - ot > 8) return 'Giờ hành chính không được > 8h';
                      return null;
                    },

                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ===== % hoàn thành =====
            FormInputField(
              nameForm: 'tech_detail_percentComplete',
              nameTextField: 'percentComplete',
              icon: Icons.percent,
              label: '% hoàn thành',
              readOnly: !_isEdit,
              initialValue: r.percentComplete.toString(),
            ),

            const SizedBox(height: 12),

            // ===== Nội dung =====
            FormInputField(
              nameForm: 'tech_detail_content',
              nameTextField: 'content',
              icon: Icons.note_outlined,
              label: 'Nội dung',
              readOnly: !_isEdit,
              initialValue: r.content,
            ),
            SizedBox(height: 12),

            // ===== Kết quả =====
            FormInputField(
              nameForm: 'tech_detail_results',
              nameTextField: 'results',
              icon: Icons.task_alt,
              label: 'Kết quả',
              readOnly: !_isEdit,
              initialValue: r.results,
            ),
            SizedBox(height: 12),

            // ===== Kế hoạch =====
            FormInputField(
              nameForm: 'tech_detail_planNextDay',
              nameTextField: 'planNextDay',
              icon: Icons.next_plan_outlined,
              label: 'Kế hoạch ngày tiếp theo',
              readOnly: !_isEdit,
              initialValue: r.planNextDay,
            ),
            SizedBox(height: 12),

            FormCard(
              title: 'Thông tin bổ sung',
              child: Column(
                children: [
                  InkWell(
                    onTap: () => setState(
                          () => _showExtraInfo = !_showExtraInfo,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _showExtraInfo
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: AppColors.primaryERP,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _showExtraInfo
                              ? 'Ẩn thông tin bổ sung'
                              : 'Hiện thông tin bổ sung',
                          style: const TextStyle(
                            color: AppColors.primaryERP,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (_showExtraInfo) ...[
                    const SizedBox(height: 8),
                    AbsorbPointer(
                      absorbing: !_isEdit,
                      child: FormInputField(
                        icon: Icons.report_problem_outlined,
                        nameForm: 'tech_detail_problem',
                        nameTextField: 'problem',
                        label: 'Vấn đề phát sinh',
                        maxLines: 1,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction
                            .newline, // ⬅ Enter xuống dòng
                        readOnly: !_isEdit,
                        initialValue: r.problem,

                      ),
                    ),
                    const SizedBox(height: 8),

                    AbsorbPointer(
                      absorbing: !_isEdit,
                      child: FormInputField(
                        icon: Icons.report_problem_outlined,
                        nameForm: 'tech_detail_problem_solve',
                        nameTextField: 'problem_solve',
                        label: 'Hướng giải quyết',
                        maxLines: 1,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction
                            .newline, // ⬅ Enter xuống dòng
                        readOnly: !_isEdit,
                        initialValue: r.problemSolve,

                      ),
                    ),
                    const SizedBox(height: 8),

                    AbsorbPointer(
                      absorbing: !_isEdit,
                      child: FormInputField(
                        icon: Icons.report_problem_outlined,
                        nameForm: 'tech_detail_backlog',
                        nameTextField: 'block',
                        label: 'Tồn động',
                        maxLines: 1,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction
                            .newline, // ⬅ Enter xuống dòng
                        readOnly: !_isEdit,
                        initialValue: r.backlog,
                      ),
                    ),
                    const SizedBox(height: 8),

                    AbsorbPointer(
                      absorbing: !_isEdit,
                      child: FormInputField(
                        icon: Icons.report_problem_outlined,
                        nameForm: 'tech_add_note',
                        nameTextField: 'note',
                        label: 'Ghi chú/Lý do tồn đọng',
                        maxLines: 1,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction
                            .newline, // ⬅ Enter xuống dòng
                        readOnly: !_isEdit,
                        initialValue: r.note,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // ===== Submit =====
            if (_isEdit)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.saveAndValidate()) return;

                    final data = _formKey.currentState!.value;

                    // bloc.add(
                    //   TechEvent.updateReport(
                    //     id: r.id,
                    //     content: data['content'],
                    //     results: data['results'],
                    //     planNextDay: data['planNextDay'],
                    //     percentComplete:
                    //     int.tryParse(data['percentComplete'] ?? '0') ?? 0,
                    //     // map thêm các field khác giống màn Add của bạn
                    //   ),
                    // );
                  },
                  child: const Text('Cập nhật'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
