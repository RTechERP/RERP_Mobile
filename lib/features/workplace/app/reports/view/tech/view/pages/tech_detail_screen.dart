import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/tech_bloc.dart';

class TechDetailScreen extends StatefulWidget {
  const TechDetailScreen({super.key});

  @override
  State<TechDetailScreen> createState() => _TechDetailScreenState();
}

class _TechDetailScreenState
    extends BaseState<TechDetailScreen, TechEvent, TechState, TechBloc> {
  bool _isEdit = false;

  @override
  void initState() {
    super.initState();
    bloc.add(const TechEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    final index = int.tryParse(
      GoRouterState.of(context).uri.queryParameters['index'] ?? '',
    ) ??
        0;

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
      body: BlocBuilder<TechBloc, TechState>(
        buildWhen: (p, c) => p.reports != c.reports,
        builder: (context, state) {
          if (state.reports.isEmpty || index >= state.reports.length) {
            return const Center(child: Text('Không tìm thấy báo cáo'));
          }

          final r = state.reports[index];

          return FormBuilder(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _field(
                  key: ValueKey('date_$index'),
                  label: 'Ngày',
                  icon: Icons.calendar_today,
                  value: DateFormat('dd/MM/yyyy').format(r.createdDate),
                  readonly: true,
                ),

                _field(
                  key: ValueKey('content_$index'),
                  label: 'Nội dung',
                  icon: Icons.note_outlined,
                  value: r.content,
                  readonly: !_isEdit,

                ),

                _field(
                  key: ValueKey('result_$index'),
                  label: 'Kết quả',
                  icon: Icons.task_alt,
                  value: r.results,
                  readonly: !_isEdit,

                ),

                _field(
                  key: ValueKey('plan_$index'),
                  label: 'Kế hoạch ngày tiếp theo',
                  icon: Icons.next_plan_outlined,
                  value: r.planNextDay,
                  readonly: !_isEdit,

                ),

                const SizedBox(height: 12),

                /// ===== DANH SÁCH PROJECT / WORK =====

                if (_isEdit)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Thêm công việc'),
                      onPressed: () {
                        bloc.add(
                          TechEvent.addWork(),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _field({
    Key? key,
    required String label,
    required IconData icon,
    String? value,
    bool readonly = false,
    ValueChanged<String?>? onChanged,
  }) {
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: 12),
      child: FormInputField(
        nameForm: label,
        nameTextField: label,
        icon: icon,
        label: label,
        readOnly: readonly,
        initialValue: value ?? '',
        onChanged: onChanged,
      ),
    );
  }
}
