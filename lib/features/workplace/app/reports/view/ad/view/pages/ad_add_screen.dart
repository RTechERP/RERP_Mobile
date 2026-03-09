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
import '../../../../../../../../common/widgets/buttons/custom_text_button.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../bloc/ad_bloc.dart';
import '../widgets/ad_add_work_item.dart';

class AdAddScreen extends StatefulWidget {
  const AdAddScreen({super.key});

  @override
  State<AdAddScreen> createState() => _AdAddScreenState();
}

class _AdAddScreenState
    extends BaseState<AdAddScreen, AdEvent, AdState, AdBloc> {
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
    bloc.add(const AdEvent.getProject());
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocListener<AdBloc, AdState>(
          listenWhen: (previous, current) =>
          previous.submitSuccess != current.submitSuccess,
          listener: (context, state) {
            if (state.submitSuccess) {
              context.pop(true);
            }
          },
          child: BaseScaffold(
            appBar: AppBarCommon(title: const Text('Tạo báo cáo')),
            body: BlocBuilder<AdBloc, AdState>(
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
                                nameForm: 'Ad_add_date',
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
                              child: BlocBuilder<AdBloc, AdState>(
                                buildWhen: (prev, curr) =>
                                prev.works != curr.works ||
                                    prev.expandedWorkIndex !=
                                        curr.expandedWorkIndex,
                                builder: (context, state) {
                                  if (state.works.isEmpty) {
                                    return CustomTextButton(
                                      width: double.infinity,
                                      bgColor: AppColors.grayColor[10],
                                      colorText: AppColors.primaryERPlight,
                                      buttonFn: () {
                                        bloc.add(const AdEvent.addWork());
                                      },
                                      child: const Text('Thêm dự án'),
                                    );
                                  }

                                  return Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      ...state.works.asMap().entries.map((
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
                                          child: AdAddWorkItem(
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
                                                AdEvent.expandWork(
                                                  index: index,
                                                ),
                                              );
                                            },
                                            onDelete: () {
                                              bloc.add(
                                                AdEvent.removeWork(
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
                                            bloc.add(const AdEvent.addWork());
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

                            /// ===== LOCATION =====
                            FormCard(
                              title: 'Nơi làm việc',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FormBuilderRadioGroup<String>(
                                    name: 'location_type',
                                    initialValue: state.locationType,
                                    options: const [
                                      FormBuilderFieldOption(
                                        value: 'rtc',
                                        child: Text('VP RTC'),
                                      ),
                                      FormBuilderFieldOption(
                                        value: 'other',
                                        child: Text('Địa điểm khác'),
                                      ),
                                    ],
                                    onChanged: (v) {
                                      if (v == null) return;
                                      bloc.add(
                                        AdEvent.updateLocation(type: v),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  if (state.locationType == 'rtc')
                                    const FormReadonlyField(
                                      name: 'Ad_add_rtc_location',
                                      label: '',
                                      icon: Icons.location_on_outlined,
                                      initialValue: 'VP RTC',
                                    )
                                  else
                                    FormInputField(
                                      icon: Icons.location_on_outlined,
                                      nameForm: 'Ad_add_location',
                                      nameTextField: 'Ad_add_other_location',
                                      label: 'Địa điểm làm việc',
                                      initialValue: state.location ?? '',
                                      onChanged: (v) {
                                        bloc.add(
                                          AdEvent.updateLocation(
                                            type: 'other',
                                            value: v,
                                          ),
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 8),

                            FormCard(
                              title: 'Kế hoạch ngày tiếp theo',
                              child: FormInputField(
                                icon: Icons.next_plan_outlined,
                                nameForm: 'Ad_add_next_plan',
                                nameTextField: 'next_plan',
                                label: 'Kế hoạch ngày tiếp theo',
                                maxLines: 3,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction
                                    .newline, // ⬅ Enter xuống dòng
                                onChanged: (v) {
                                  if (v == null) return;
                                  bloc.add(AdEvent.updatePlanNextDay(v));
                                },
                              ),
                            ),
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

                          final error = ValidateHelper.validateAgvAdReport(
                            date: values['Ad_add_date'] as DateTime?,
                            works: state.works,
                            getProjectName: (w) => w.projectName,
                            getTotalHours: (w) => w.totalHours,
                            getOtHours: (w) => w.totalHourOT,
                            getContent: (w) => w.content,
                            getResult: (w) => w.results,
                            locationType: state.locationType,
                            location: state.location,
                            nextPlan: values['next_plan'],
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
                          values['Ad_add_date'] as DateTime?;
                          if (pickedDate == null) return;

                          bloc.add(AdEvent.submitReport(pickedDate));
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
        BlocBuilder<AdBloc, AdState>(
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
