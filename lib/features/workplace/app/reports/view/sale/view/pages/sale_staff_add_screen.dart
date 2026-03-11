import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/buttons/custom_text_button.dart';
import '../bloc/sale_bloc.dart';
import '../widgets/sale_staff_add_item.dart';

class SaleStaffAddScreen extends StatefulWidget {
  const SaleStaffAddScreen({super.key});

  @override
  State<SaleStaffAddScreen> createState() => _SaleStaffAddScreenState();
}

class _SaleStaffAddScreenState
    extends BaseState<SaleStaffAddScreen, SaleEvent, SaleState, SaleBloc> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(const SaleEvent.init());
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<SaleBloc, SaleState>(
          listenWhen: (previous, current) =>
              previous.submitSuccess != current.submitSuccess,
          listener: (context, state) {
            if (state.submitSuccess) {
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(title: const Text('Tạo báo cáo')),
            body: BlocBuilder<SaleBloc, SaleState>(
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
                            /// ===== NGÀY =====
                            FormCard(
                              child: FormDateTimePicker(
                                icon: Icons.calendar_today,
                                nameForm: 'sale_staff_add_report_time',
                                nameTimePicker: 'date_time',
                                label: 'Ngày báo cáo',
                                inputType: InputType.date,
                                initialValue: _initialReportDate(),
                                format: DateFormat('dd/MM/yyyy'),
                              ),
                            ),
                            const SizedBox(height: 8),
                            /// ===== DANH SÁCH CÔNG VIỆC CP (Ad) =====
                            FormCard(
                              child: BlocBuilder<SaleBloc, SaleState>(
                                buildWhen: (prev, curr) =>
                                    prev.staffWorks != curr.staffWorks ||
                                    prev.expandedWorkIndex !=
                                        curr.expandedWorkIndex,
                                builder: (context, state) {
                                  if (state.staffWorks.isEmpty) {
                                    return CustomTextButton(
                                      width: double.infinity,
                                      bgColor: AppColors.grayColor[10],
                                      colorText: AppColors.primaryERPlight,
                                      buttonFn: () {
                                        bloc.add(const SaleEvent.addWork());
                                      },
                                      child: const Text('Thêm dự án'),
                                    );
                                  }

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...state.staffWorks.asMap().entries.map((
                                        entry,
                                      ) {
                                        final index = entry.key;
                                        final work = entry.value;

                                        final hasData = (work.projectName ?? '')
                                            .trim()
                                            .isNotEmpty;

                                        final title = hasData
                                            ? work.projectCode!
                                            : 'Dự án ${index + 1}';

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          child: SaleStaffAddItem(
                                            key: ValueKey(work.id ?? index),
                                            report: work,
                                            readonly: false,
                                            title: title,
                                            index: index,
                                            isExpanded:
                                                state.expandedWorkIndex ==
                                                index,
                                            onToggleExpand: () {
                                              bloc.add(
                                                SaleEvent.expandWork(
                                                  index: index,
                                                ),
                                              );
                                            },
                                            onDelete: () {
                                              bloc.add(
                                                SaleEvent.removeWork(
                                                  index: index,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }),

                                      const SizedBox(height: 8),

                                      Center(
                                        child: InkResponse(
                                          onTap: () {
                                            bloc.add(const SaleEvent.addWork());
                                          },
                                          radius: 28,
                                          child: const Icon(
                                            Icons.add_circle_outline,
                                            size: 32,
                                            color: AppColors.primaryERP,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),

                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),

                    /// ===== ACTIONS =====
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: FormActions(
                        mode: FormActionMode.add,
                        onSubmit: () {
                          FocusScope.of(context).unfocus();

                          final formState = _formKey.currentState;
                          if (formState == null) return;

                          final isValid = formState.saveAndValidate();
                          if (!isValid) return;

                          final values = formState.value;

                          // final error = ValidateHelper.validateAgvAdReport(
                          //   date: values['Ad_add_date'] as DateTime?,
                          //   works: state.works,
                          //   getProjectName: (w) => w.projectName,
                          //   getTotalHours: (w) => w.totalHours,
                          //   getOtHours: (w) => w.totalHourOT,
                          //   getContent: (w) => w.content,
                          //   getResult: (w) => w.results,
                          //   locationType: state.locationType,
                          //   location: state.location,
                          //   nextPlan: values['next_plan'],
                          // );
                          //
                          // if (error != null) {
                          //   showMessage(
                          //     context,
                          //     error,
                          //     type: SnackBarType.error,
                          //   );
                          //   return;
                          // }

                          final pickedDate = values['Ad_add_date'] as DateTime?;
                          if (pickedDate == null) return;

                          // bloc.add(SaleEvent.submitReport(pickedDate));
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),

        /// ===== LOADING OVERLAY =====
        BlocBuilder<SaleBloc, SaleState>(
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
