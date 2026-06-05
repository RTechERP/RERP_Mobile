import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/app_colors.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../data/datasource/models/stamp_model.dart';
import '../bloc/stamp_bloc.dart';

// ---------------------------------------------------------------------------
// Detail Screen
// ---------------------------------------------------------------------------
class StampDetailScreen extends StatefulWidget {
  final StampItem item;

  const StampDetailScreen({super.key, required this.item});

  @override
  State<StampDetailScreen> createState() => _StampDetailScreenState();
}

class _StampDetailScreenState
    extends BaseState<StampDetailScreen, StampEvent, StampState, StampBloc> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (widget.item.id != null) {
        bloc.add(StampEvent.initDetail(id: widget.item.id!));
      }
    });
  }

  @override
  bool listenWhen(StampState previous, StampState current) {
    return previous.deleteSuccess != current.deleteSuccess ||
        previous.message != current.message;
  }

  @override
  void listener(BuildContext context, StampState state) {
    if (state.deleteSuccess) {
      showMessage(context, 'Xóa thành công', type: SnackBarType.success);
      bloc.add(const StampEvent.clearDeleteState());
      context.pop(true);
      return;
    }
    if (state.status == BaseStateStatus.failed &&
        (state.message ?? '').isNotEmpty) {
      showMessage(context, state.message!, type: SnackBarType.error);
      bloc.add(const StampEvent.clearDeleteState());
    }
  }

  Color _getStatusColor(int? status) {
    switch (status) {
      case 1:
        return AppColors.success;
      case 2:
        return AppColors.alert;
      default:
        return AppColors.warning;
    }
  }

  String _getStatusText(int? status) {
    switch (status) {
      case 1:
        return 'Đã duyệt';
      case 2:
        return 'Đã hủy';
      default:
        return 'Chờ duyệt';
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<StampBloc, StampState>(
      bloc: bloc,
      builder: (context, state) {
        final item = state.detailItem ?? widget.item;

        return BaseScaffold(
          appBar: AppBar(
            title: Text('Chi tiết đăng ký dấu', style: AppStyles.headingTitle2),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            actions: [
              if (item.status == 0) ...[
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {
                    // Navigate to edit
                    context.pushReplacement(
                      '/reg_general/stamp/edit',
                      extra: item,
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    color: AppColors.alert,
                  ),
                  onPressed: () => _showDeleteConfirmation(context, item),
                ),
              ],
            ],
          ),
          body: state.isDetailLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status Badge
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusColor(
                              item.status,
                            ).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _getStatusText(item.status),
                            style: TextStyle(
                              color: _getStatusColor(item.status),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Document Type
                      _DetailCard(
                        title: 'Loại tài liệu',
                        content: item.documentTypeName ?? 'Không có',
                        icon: Icons.description_outlined,
                      ),
                      const SizedBox(height: 12),

                      // Document Name
                      _DetailCard(
                        title: 'Tên tài liệu',
                        content: item.documentName ?? 'Không có',
                        icon: Icons.article_outlined,
                      ),
                      const SizedBox(height: 12),

                      // Document Quantity
                      _DetailCard(
                        title: 'Số lượng',
                        content: '${item.documentQuantity ?? 1}',
                        icon: Icons.numbers,
                      ),
                      const SizedBox(height: 12),

                      // Document Total Page
                      _DetailCard(
                        title: 'Tổng số trang',
                        content: '${item.documentTotalPage ?? 1}',
                        icon: Icons.pages,
                      ),
                      const SizedBox(height: 24),

                      // Employee Info
                      _SectionHeader(title: 'Thông tin nhân viên'),
                      const SizedBox(height: 12),

                      _DetailCard(
                        title: 'Nhân viên đăng ký',
                        content: item.employeeName ?? 'Không có',
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 12),

                      _DetailCard(
                        title: 'Phòng ban',
                        content: item.departmentName ?? 'Không có',
                        icon: Icons.business_outlined,
                      ),
                      const SizedBox(height: 24),

                      // Approval Info
                      _SectionHeader(title: 'Thông tin phê duyệt'),
                      const SizedBox(height: 12),

                      _DetailCard(
                        title: 'Người duyệt',
                        content: item.approvedName ?? 'Chưa có',
                        icon: Icons.verified_user_outlined,
                      ),
                      const SizedBox(height: 12),

                      if (item.approvedDate != null)
                        _DetailCard(
                          title: 'Ngày duyệt',
                          content: _formatDate(item.approvedDate!),
                          icon: Icons.event_available_outlined,
                        ),
                      const SizedBox(height: 24),

                      // Sign Info
                      _SectionHeader(title: 'Thông tin ký'),
                      const SizedBox(height: 12),

                      _DetailCard(
                        title: 'Người ký',
                        content: item.employeeSignName ?? 'Chưa có',
                        icon: Icons.draw_outlined,
                      ),
                      const SizedBox(height: 12),

                      if (item.signDatedActual != null)
                        _DetailCard(
                          title: 'Ngày ký',
                          content: _formatDate(item.signDatedActual!),
                          icon: Icons.event_note_outlined,
                        ),
                      const SizedBox(height: 24),

                      // Dates Info
                      _SectionHeader(title: 'Thông tin thời gian'),
                      const SizedBox(height: 12),

                      _DetailCard(
                        title: 'Ngày đăng ký',
                        content: item.registerDate != null
                            ? _formatDate(item.registerDate!)
                            : 'Không có',
                        icon: Icons.calendar_today_outlined,
                      ),
                      const SizedBox(height: 12),

                      if (item.createdDate != null)
                        _DetailCard(
                          title: 'Ngày tạo',
                          content: _formatDate(item.createdDate!),
                          icon: Icons.create_outlined,
                        ),
                      const SizedBox(height: 12),

                      if (item.updatedDate != null)
                        _DetailCard(
                          title: 'Ngày cập nhật',
                          content: _formatDate(item.updatedDate!),
                          icon: Icons.update_outlined,
                        ),

                      // Urgent Badge
                      if (item.isUrgent == true) ...[
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.alert.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.alert),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.priority_high,
                                color: AppColors.alert,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Đánh dấu khẩn cấp',
                                style: TextStyle(
                                  color: AppColors.alert,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      // Reason Cancel
                      if (item.reasonCancel != null &&
                          item.reasonCancel!.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.gray.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Lý do hủy:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textSecondaryColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(item.reasonCancel!),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    StampItem item,
  ) async {
    final confirmed = await DialogService.showConfirmDelete(context: context);
    if (!mounted || !confirmed || item.id == null) return;
    bloc.add(StampEvent.deleteStamp(id: item.id!));
  }
}

// ---------------------------------------------------------------------------
// Helper Widgets
// ---------------------------------------------------------------------------
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textMain,
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({
    required this.title,
    required this.content,
    required this.icon,
  });

  final String title;
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.gray),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryERP.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primaryERP, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
