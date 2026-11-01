import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../common/utils/dialog/dialog_service.dart';
import '../../../../../../../../di/injection.dart';
import '../../../../../../../../routes/route_names.dart';
import '../../data/datasource/models/lead_source_model.dart';
import '../bloc/lead_source_bloc.dart';

/// Màn hình danh sách Nguồn Lead trong CRM.
class LeadSourceScreen extends StatefulWidget {
  const LeadSourceScreen({super.key});

  @override
  State<LeadSourceScreen> createState() => _LeadSourceScreenState();
}

class _LeadSourceScreenState extends State<LeadSourceScreen> {
  late final LeadSourceBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<LeadSourceBloc>();
    _bloc.add(const LeadSourceEvent.init());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Nguồn Lead'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocConsumer<LeadSourceBloc, LeadSourceState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.deleteStatus == BaseStateStatus.success) {
            if (state.deleteMessage != null) {
              context.showMessage(state.deleteMessage!);
            }
            _bloc.add(const LeadSourceEvent.clearDeleteState());
            _bloc.add(const LeadSourceEvent.refresh());
          } else if (state.deleteStatus == BaseStateStatus.failed) {
            if (state.deleteMessage != null) {
              context.showMessage(state.deleteMessage!);
            }
            _bloc.add(const LeadSourceEvent.clearDeleteState());
          }
        },
        builder: (context, state) {
          if (state.status == BaseStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == BaseStateStatus.failed) {
            return Center(
              child: Text(
                state.message ?? 'Có lỗi xảy ra',
                style: AppStyles.body2.copyWith(color: AppColors.heading),
              ),
            );
          }

          if (state.sources.isEmpty) {
            return Center(
              child: Text(
                'Chưa có nguồn lead nào',
                style: AppStyles.body2.copyWith(color: AppColors.heading),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              _bloc.add(const LeadSourceEvent.refresh());
              await Future<void>.delayed(const Duration(seconds: 1));
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.sources.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final source = state.sources[index];
                return _LeadSourceCard(
                  source: source,
                  onTap: () => _goToEditScreen(source),
                  onDelete: () => _confirmDelete(context, source),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddScreen,
        backgroundColor: AppColors.primaryERP,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  void _goToAddScreen() {
    context.push(RouteNames.leadSourceAdd).then((_) {
      _bloc.add(const LeadSourceEvent.refresh());
    });
  }

  void _goToEditScreen(LeadSourceItem source) {
    context.push(RouteNames.leadSourceAdd, extra: source).then((_) {
      _bloc.add(const LeadSourceEvent.refresh());
    });
  }

  Future<void> _confirmDelete(BuildContext context, LeadSourceItem source) async {
    final confirmed = await DialogService.showConfirmDialog(
      context: context,
      title: 'Xác nhận xoá',
      message: 'Bạn có chắc chắn muốn xoá nguồn lead "${source.name}"?',
    );
    if (confirmed == true && mounted) {
      _bloc.add(LeadSourceEvent.delete(source.id));
    }
  }
}

/// Card hiển thị thông tin nguồn lead.
class _LeadSourceCard extends StatelessWidget {
  final LeadSourceItem source;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _LeadSourceCard({
    required this.source,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final groupName = source.sourceGroup == 1
        ? 'Marketing'
        : source.sourceGroup == 2
            ? 'Sales'
            : 'Không xác định';

    return Slidable(
      key: ValueKey(source.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onDelete(),
            backgroundColor: AppColors.redA500,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Xoá',
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      source.name,
                      style: AppStyles.subtitle2.copyWith(
                        color: AppColors.heading,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: source.sourceGroup == 1
                          ? AppColors.blueA100
                          : AppColors.greenA100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      groupName,
                      style: AppStyles.caption2.copyWith(
                        color: source.sourceGroup == 1
                            ? AppColors.blueA500
                            : AppColors.greenA500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.tag,
                    size: 14,
                    color: AppColors.label,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    source.code,
                    style: AppStyles.body2.copyWith(
                      color: AppColors.label,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (source.stt != null) ...[
                    const SizedBox(width: 12),
                    Icon(
                      Icons.format_list_numbered,
                      size: 14,
                      color: AppColors.label,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'STT: ${source.stt}',
                      style: AppStyles.caption2.copyWith(
                        color: AppColors.label,
                      ),
                    ),
                  ],
                ],
              ),
              if (source.note != null && source.note!.isNotEmpty) ...[
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.note_outlined,
                      size: 14,
                      color: AppColors.label,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        source.note!,
                        style: AppStyles.caption2.copyWith(
                          color: AppColors.label,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
