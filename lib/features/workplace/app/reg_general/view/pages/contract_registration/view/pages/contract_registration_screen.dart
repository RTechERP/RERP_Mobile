import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../../../../../../../common/utils/snack_bar_helper.dart';
import '../../../booking_vehicle/view/widgets/date_header.dart';
import '../../../booking_vehicle/view/widgets/date_range_picker.dart';
import '../bloc/contract_registration_bloc.dart';
import '../widgets/contract_registration_card.dart';

class ContractRegistrationScreen extends StatefulWidget {
  const ContractRegistrationScreen({super.key});

  @override
  State<ContractRegistrationScreen> createState() =>
      _ContractRegistrationScreenState();
}

class _ContractRegistrationScreenState
    extends
        BaseState<
          ContractRegistrationScreen,
          ContractRegistrationEvent,
          ContractRegistrationState,
          ContractRegistrationBloc
        > {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  bool _isSearchActive = false;

  @override
  void initState() {
    super.initState();
    bloc.add(const ContractRegistrationEvent.init());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    bloc.add(const ContractRegistrationEvent.init());
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void _showDateRangePicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => DateRangePicker(
        initialStart: bloc.state.dateStart,
        initialEnd: bloc.state.dateEnd,
        onApply: (start, end) {
          bloc.add(
            ContractRegistrationEvent.changeDateRange(
              dateStart: start,
              dateEnd: end,
            ),
          );
        },
      ),
    );
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    if (value.trim().isEmpty) {
      // Xóa hết → reload ngay với keyword rỗng
      bloc.add(const ContractRegistrationEvent.searchContracts(keyword: ''));
      return;
    }
    // Đợi 600ms không gõ nữa mới search
    _debounce = Timer(const Duration(milliseconds: 600), () {
      bloc.add(
        ContractRegistrationEvent.searchContracts(keyword: value.trim()),
      );
    });
  }

  void _clearSearch() {
    _searchController.clear();
    _debounce?.cancel();
    bloc.add(const ContractRegistrationEvent.searchContracts(keyword: ''));
    setState(() => _isSearchActive = false);
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocListener<ContractRegistrationBloc, ContractRegistrationState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status || prev.message != curr.message,
      listener: (context, state) {
        if (state.status == BaseStateStatus.failed && state.message != null) {
          context.showMessage(state.message!, type: SnackBarType.error);
        }
      },
      child: BlocBuilder<ContractRegistrationBloc, ContractRegistrationState>(
        buildWhen: (prev, curr) =>
            prev.status != curr.status ||
            prev.contracts.length != curr.contracts.length,
        builder: (context, state) {
          return BaseScaffold(
            appBar: AppBarCommon(
              title: _isSearchActive
                  ? _buildSearchField()
                  : const Text('Đăng ký hợp đồng'),
              onBackTap: () =>
                  _isSearchActive ? _clearSearch() : onBack(context),
              actions: _isSearchActive
                  ? [
                      if (_searchController.text.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.clear, size: 20),
                          onPressed: () {
                            _searchController.clear();
                            bloc.add(
                              const ContractRegistrationEvent.searchContracts(
                                keyword: '',
                              ),
                            );
                          },
                        ),
                    ]
                  : [
                      IconButton(
                        icon: const Icon(Icons.search),
                        tooltip: 'Tìm kiếm',
                        onPressed: () => setState(() => _isSearchActive = true),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_month),
                        tooltip: 'Lọc ngày',
                        onPressed: () => _showDateRangePicker(context),
                      ),
                    ],
            ),
            body: Column(
              children: [
                if (state.dateStart != null)
                  DateHeader(
                    dateStart: state.dateStart,
                    dateEnd: state.dateEnd,
                    currentLabel: 'Hiện tại',
                    fromLabel: 'Từ',
                    toLabel: 'Đến',
                  ),
                Expanded(child: _buildBody(context, state)),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryERP,
              foregroundColor: Colors.white,
              onPressed: () async {
                final result = await context.push<bool>(
                  RouteNames.contractRegistrationAdd,
                );
                if (result == true) {
                  bloc.add(const ContractRegistrationEvent.init());
                }
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      style: const TextStyle(fontSize: 16, color: AppColors.heading),
      decoration: const InputDecoration(
        hintText: 'Tìm kiếm hợp đồng...',
        hintStyle: TextStyle(fontSize: 16, color: AppColors.hintText),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      onChanged: _onSearchChanged,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        _debounce?.cancel();
        bloc.add(
          ContractRegistrationEvent.searchContracts(keyword: value.trim()),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, ContractRegistrationState state) {
    if (state.status == BaseStateStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == BaseStateStatus.failed) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.error, width: 320),
            const SizedBox(height: 12),
            const Text('Tải dữ liệu thất bại'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                bloc.add(const ContractRegistrationEvent.init());
              },
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primaryERP,
              ),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (state.contracts.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.missing, width: 320),
            const SizedBox(height: 12),
            const Text('Không có bản ghi nào'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _onRefresh,
      color: AppColors.primaryERP,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: state.contracts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = state.contracts[index];
          return ContractRegistrationCard(
            item: item,
            onTap: () {
            },
          );
        },
      ),
    );
  }
}