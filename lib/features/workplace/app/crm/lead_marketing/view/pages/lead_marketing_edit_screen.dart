import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/enums/index.dart';
import '../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../../../../../../common/widgets/form/index.dart';
import '../../data/datasource/models/lead_marketing_model.dart';
import '../bloc/lead_marketing_bloc.dart';
import '../widgets/lead_marketing_form.dart';

/// Màn chỉnh sửa phiếu lead.
///
/// Dùng chung form [LeadMarketingForm] với màn tạo mới nên giao diện và
/// luồng nhập liệu giống hệt, chỉ khác ở chỗ dữ liệu được fill sẵn từ
/// `GET /Lead/get-detail?id=X` và payload khi lưu có kèm `ID` + `Stage`
/// của phiếu đang sửa.
class LeadMarketingEditScreen extends StatefulWidget {
  const LeadMarketingEditScreen({
    super.key,
    required this.leadId,
    this.stage,
    this.customerLabel,
    this.customerSnapshot,
  });

  /// ID phiếu lead cần chỉnh sửa.
  final int leadId;

  /// Giai đoạn hiện tại của phiếu — được gửi lại khi lưu.
  final int? stage;

  /// Tên khách hàng hiển thị sẵn (fallback khi danh mục chưa tải).
  final String? customerLabel;

  /// Thông tin khách hàng tạm để dựng payload khi chưa có chi tiết API.
  final LeadCustomer? customerSnapshot;

  @override
  State<LeadMarketingEditScreen> createState() => _LeadMarketingEditScreenState();
}

class _LeadMarketingEditScreenState
    extends
        BaseShareState<
          LeadMarketingEditScreen,
          LeadMarketingEvent,
          LeadMarketingState,
          LeadMarketingBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Key của widget form — dùng để gọi validate + submit.
  final _formWidgetKey = GlobalKey<LeadMarketingFormState>();

  /// Đã xử lý kết quả lưu phiếu lead hiện tại chưa.
  bool _submitResultHandled = false;

  @override
  void initState() {
    super.initState();
    // Tải chi tiết phiếu để fill sẵn form.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      bloc.add(LeadMarketingEvent.loadDetail(id: widget.leadId));
    });
  }

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<LeadMarketingBloc, LeadMarketingState>(
          listenWhen: (previous, current) =>
              previous.submitStatus != current.submitStatus,
          listener: (context, state) {
            if (state.submitStatus == BaseStateStatus.success) {
              if (_submitResultHandled) return;
              _submitResultHandled = true;
              final result = state.saveResult;
              final message = state.submitMessage ?? 'Cập nhật lead thành công!';
              final code = result?.leadCode;
              showMessage(
                context,
                code == null || code.isEmpty ? message : '$message ($code)',
                type: SnackBarType.success,
              );
              bloc.add(const LeadMarketingEvent.clearSubmitState());
              // Tải lại danh sách để phiếu vừa sửa hiển thị ngay.
              bloc.add(const LeadMarketingEvent.refresh());
              _hideKeyboard();
              context.pop();
            } else if (state.submitStatus == BaseStateStatus.failed) {
              if (_submitResultHandled) return;
              _submitResultHandled = true;
              showMessage(
                context,
                state.submitMessage ?? 'Lưu phiếu lead thất bại',
                type: SnackBarType.error,
              );
              bloc.add(const LeadMarketingEvent.clearSubmitState());
            }
          },
          builder: (context, state) {
            return BaseScaffold(
              appBar: AppBarCommon(
                title: const Text('Chỉnh sửa phiếu Lead'),
                onBackTap: () => context.pop(),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: LeadMarketingForm(
                      key: _formWidgetKey,
                      bloc: bloc,
                      formKey: _formKey,
                      editLeadId: widget.leadId,
                      editStage: widget.stage,
                      customerLabel: widget.customerLabel,
                      editCustomerSnapshot: widget.customerSnapshot,
                      onSubmit: (payload) {
                        _submitResultHandled = false;
                        bloc.add(LeadMarketingEvent.submitLead(payload: payload));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FormActions(
                      mode: FormActionMode.add,
                      submitText: 'Lưu',
                      submitEnabled:
                          state.submitStatus != BaseStateStatus.loading,
                      onSubmit: () => _formWidgetKey.currentState?.submit(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        /// Overlay loading khi đang kiểm tra trùng lặp / lưu phiếu lead.
        BlocBuilder<LeadMarketingBloc, LeadMarketingState>(
          buildWhen: (p, c) => p.submitStatus != c.submitStatus,
          builder: (context, state) {
            if (state.submitStatus != BaseStateStatus.loading) {
              return const SizedBox.shrink();
            }
            return Positioned.fill(
              child: AbsorbPointer(
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

  /// Ẩn bàn phím và bỏ focus ô nhập trước khi thoát màn.
  void _hideKeyboard() {
    final focusScope = FocusScope.of(context);
    focusScope.unfocus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      focusScope.unfocus();
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      focusScope.unfocus();
    });
  }
}
