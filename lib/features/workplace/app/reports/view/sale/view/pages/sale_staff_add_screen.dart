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
import '../../../../../../../../common/helpers/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/buttons/custom_text_button.dart';
import '../bloc/sale_bloc.dart';
import '../widgets/sale_staff_add_item.dart';

/// Màn tạo báo cáo sale.
///
/// Dùng chung cho 2 luồng:
/// - Tạo báo cáo thường từ module Báo cáo ([leadCustomerId] = null).
/// - "Ghi hoạt động" từ phiếu Lead Sale: truyền [leadCustomerId] (0 nếu phiếu
///   chưa có khách hàng) để điền sẵn dự án, hãng, loại dự án, khách hàng,
///   trạng thái dự án, ngày, người liên hệ và sản phẩm của KH.
class SaleStaffAddScreen extends StatefulWidget {
  const SaleStaffAddScreen({
    super.key,
    this.leadCustomerId,
    this.leadContactName,
    this.leadCode,
    this.needDescription,
  });

  /// Khách hàng của phiếu lead; khác null nghĩa là mở từ Lead Sale.
  final int? leadCustomerId;

  /// Tên người liên hệ trên phiếu lead, dùng để chọn sẵn người liên hệ.
  final String? leadContactName;

  /// Mã phiếu lead, hiển thị trên tiêu đề.
  final String? leadCode;

  /// Mô tả nhu cầu từ phiếu lead, dùng để fill sẵn vào "Việc đã làm".
  final String? needDescription;

  /// Màn được mở từ "Ghi hoạt động" của Lead Sale.
  bool get isFromLead => leadCustomerId != null;

  @override
  State<SaleStaffAddScreen> createState() => _SaleStaffAddScreenState();
}

class _SaleStaffAddScreenState
    extends BaseState<SaleStaffAddScreen, SaleEvent, SaleState, SaleBloc> {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Tiêu đề màn: "Ghi hoạt động - mã lead" khi mở từ Lead Sale.
  String get _title {
    if (!widget.isFromLead) return 'Tạo báo cáo';
    final code = (widget.leadCode ?? '').trim();
    return code.isEmpty ? 'Ghi hoạt động' : 'Ghi hoạt động - $code';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final leadCustomerId = widget.leadCustomerId;
      if (leadCustomerId != null) {
        bloc.add(
          SaleEvent.prefillFromLead(
            customerId: leadCustomerId,
            contactName: widget.leadContactName,
            needDescription: widget.needDescription,
          ),
        );
        return;
      }
      bloc.add(const SaleEvent.init());
      bloc.add(const SaleEvent.getSaleProject());
      bloc.add(const SaleEvent.getFirmBase());
      bloc.add(const SaleEvent.getTypeProjectBase());
      bloc.add(const SaleEvent.getCustomer());
      bloc.add(const SaleEvent.getTypeTeamSale());
      bloc.add(const SaleEvent.getStatusProject());
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
            // Route nằm trong ShellRoute của Sale: khi mở từ Lead Sale, navigator
            // của shell chỉ có 1 trang nên AppBar không tự hiện nút back.
            appBar: AppBarCommon(
              title: Text(_title),
              onBackTap: () => context.pop(),
            ),
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
                                    prev.staffWorks != curr.staffWorks ||
                                    prev.expandedWorkIndex !=
                                        curr.expandedWorkIndex,
                                builder: (context, state) {
                                  // Đang điền sẵn dữ liệu từ phiếu lead.
                                  if (widget.isFromLead &&
                                      state.staffWorks.isEmpty) {
                                    return const Padding(
                                      padding: EdgeInsets.all(24),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
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

                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 8,
                                          ),
                                          child: SaleStaffAddItem(
                                            key: ValueKey(work.id ?? index),
                                            report: work,
                                            readonly: false,
                                            title: 'Báo cáo ${index + 1}',
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
                          final error = ValidateHelper.validateSaleStaffReport(
                            reports: state.staffWorks,

                            getFirmName: (e) => e.firmName ?? '',
                            getProjectTypeBaseID: (e) => e.typeProjectId,
                            getCustomerName: (e) => e.customerName ?? '',
                            getProjectTypeName: (e) => e.typeProjectName ?? '',
                            getContactName: (e) => e.customerContactName ?? '',
                            getMainIndex: (e) => e.typeTeamSaleMainIndex ?? '',
                            getContent: (e) => e.content,
                            getResult: (e) => e.results,
                            getPlanNext: (e) => e.planNextDay,
                            getProductOfCustomer: (e) => e.customerProduct ?? '',
                            getStatusName: (e) => e.statusProjectName ?? '',
                          );

                          if (error != null) {
                            showMessage(
                              context,
                              error,
                              type: SnackBarType.error,
                            );
                            return;
                          }
                          bloc.add(SaleEvent.submitReport(DateTime.now()));
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
