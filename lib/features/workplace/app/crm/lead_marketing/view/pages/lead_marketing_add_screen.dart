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
import '../bloc/lead_marketing_bloc.dart';
import '../widgets/lead_marketing_form.dart';

/// Màn tạo phiếu lead mới cho CRM.
///
/// Dùng chung form [LeadMarketingForm] với màn chỉnh sửa nên giao diện và
/// luồng nhập liệu luôn giống nhau.
///
/// Toàn bộ danh mục chọn được tải sẵn ở màn danh sách nên khi mở form này
/// người dùng không phải chờ mạng.
class LeadMarketingAddScreen extends StatefulWidget {
  const LeadMarketingAddScreen({super.key});

  @override
  State<LeadMarketingAddScreen> createState() => _LeadMarketingAddScreenState();
}

class _LeadMarketingAddScreenState
    extends
        BaseShareState<
          LeadMarketingAddScreen,
          LeadMarketingEvent,
          LeadMarketingState,
          LeadMarketingBloc
        > {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Key của widget form — dùng để gọi validate + submit.
  final _formWidgetKey = GlobalKey<LeadMarketingFormState>();

  /// Đã xử lý kết quả lưu phiếu lead hiện tại chưa.
  ///
  /// Bloc là singleton nên kết quả có thể còn sót trong state; cờ này đảm bảo
  /// mỗi kết quả chỉ được xử lý đúng một lần.
  bool _submitResultHandled = false;

  @override
  Widget renderUI(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<LeadMarketingBloc, LeadMarketingState>(
          listenWhen: (previous, current) =>
              previous.submitStatus != current.submitStatus,
          listener: (context, state) {
            // Kết quả lưu phiếu lead.
            if (state.submitStatus == BaseStateStatus.success) {
              if (_submitResultHandled) return;
              _submitResultHandled = true;
              final result = state.saveResult;
              final message = state.submitMessage ?? 'Thêm lead thành công!';
              final code = result?.leadCode;
              showMessage(
                context,
                code == null || code.isEmpty ? message : '$message ($code)',
                type: SnackBarType.success,
              );
              // Bloc là singleton → xóa trạng thái để lần mở màn sau không bị
              // lặp lại thông báo và đẩy người dùng ra khỏi màn.
              bloc.add(const LeadMarketingEvent.clearSubmitState());
              // Tải lại danh sách để phiếu vừa tạo hiển thị ngay.
              bloc.add(const LeadMarketingEvent.refresh());
              // Upload các file đính kèm đã chọn — lúc này mới có ID phiếu.
              final leadId = result?.id;
              if (leadId != null) {
                _formWidgetKey.currentState?.uploadPendingFiles(leadId);
              }
              // Tắt bàn phím trước khi pop, tránh bàn phím nhấp nháy lên
              // rồi tắt khi thoát màn.
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
                title: const Text('Tạo phiếu Lead'),
                onBackTap: () => context.pop(),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: LeadMarketingForm(
                      key: _formWidgetKey,
                      bloc: bloc,
                      formKey: _formKey,
                      onSubmit: (payload) {
                        // Cho phép xử lý kết quả mới (sau lần lưu trước đã
                        // được xử lý rồi).
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
