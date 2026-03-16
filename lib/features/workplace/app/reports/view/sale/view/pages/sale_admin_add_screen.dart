import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/widgets/form/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/widgets/buttons/custom_text_button.dart';
import '../bloc/sale_bloc.dart';
import '../widgets/sale_admin_add_item.dart';

class SaleAdminAddScreen extends StatefulWidget {
  const SaleAdminAddScreen({super.key});

  @override
  State<SaleAdminAddScreen> createState() => _SaleAdminAddScreenState();
}

class _SaleAdminAddScreenState
    extends BaseState<SaleAdminAddScreen, SaleEvent, SaleState, SaleBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(const SaleEvent.init());
      bloc.add(const SaleEvent.getAdminProject());
      bloc.add(const SaleEvent.getAdminCustomer());
      bloc.add(const SaleEvent.getAdminTypeReport());
      bloc.add(const SaleEvent.getAllUser());
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
                            /// ===== DANH SÁCH CÔNG VIỆC SALE =====
                            FormCard(
                              child: BlocBuilder<SaleBloc, SaleState>(
                                buildWhen: (prev, curr) =>
                                prev.adminWorks != curr.adminWorks ||
                                    prev.expandedWorkIndex !=
                                        curr.expandedWorkIndex,
                                builder: (context, state) {
                                  if (state.adminWorks.isEmpty) {
                                    return CustomTextButton(
                                      width: double.infinity,
                                      bgColor: AppColors.grayColor[10],
                                      colorText: AppColors.primaryERPlight,
                                      buttonFn: () {
                                        bloc.add(const SaleEvent.addWork());
                                      },
                                      child: const Text('Thêm'),
                                    );
                                  }

                                  return Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      ...state.adminWorks.asMap().entries.map((
                                          entry,
                                          ) {
                                        final index = entry.key;
                                        final work = entry.value;

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          child: SaleAdminAddItem(
                                            key: ValueKey(work.id ?? index),
                                            report: work,
                                            readonly: false,
                                            title: 'Nhân viên ${index + 1}',
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
                          // Hiện tại tất cả dateStart/dateEnd nằm trong từng SaleStaffWork
                          // (được cập nhật ở SaleStaffAddItem), nên chỉ cần dùng ngày hôm nay
                          // làm ngày submit tổng thể.

                          bloc.add(SaleEvent.submitAdminReport(DateTime.now()));
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
