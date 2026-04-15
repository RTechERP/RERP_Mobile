// Date: 15/04/2026 - Dev: NQHung
// Nội dung/Chức năng: Màn hình danh sách đăng ký văn phòng phẩm

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../../base/bloc/index.dart';
import '../../../../../../../../../base/widgets/base_scaffold.dart';
import '../../../../../../../../../base/widgets/base_widget.dart';
import '../../../../../../../../../common/app_theme/index.dart';
import '../../../../../../../../../common/constants/index.dart';
import '../../../../../../../../../common/utils/navigation/navigation_utils.dart';
import '../../../../../../../../../routes/route_names.dart';
import '../../../booking_vehicle/view/widgets/date_header.dart';
import '../bloc/stationery_bloc.dart';
import '../widgets/stationery_card.dart';
import '../../data/datasource/models/stationery_model.dart';

class StationeryScreen extends StatefulWidget {
  const StationeryScreen({super.key});

  @override
  State<StationeryScreen> createState() => _StationeryScreenState();
}

class _StationeryScreenState
    extends BaseState<
        StationeryScreen,
        StationeryEvent,
        StationeryState,
        StationeryBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const StationeryEvent.init());
  }

  void _openDetail(StationeryItem item) {
    context.push(RouteNames.stationeryDetail, extra: item);
  }

  void _openAdd() async {
    final result = await context.push<bool?>(RouteNames.stationeryAdd);
    if (result == true && mounted) {
      bloc.add(const StationeryEvent.init());
    }
  }

  @override
  Widget renderUI(BuildContext context) {
    return BlocBuilder<StationeryBloc, StationeryState>(
      builder: (context, state) {
        return BaseScaffold(
          appBar: AppBarCommon(
            title: const Text('Văn phòng phẩm'),
            onBackTap: () => onBack(context),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryERP,
            foregroundColor: Colors.white,
            onPressed: _openAdd,
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: DateHeader(
                  dateStart: DateTime.now(),
                  dateEnd: DateTime.now(),
                ),
              ),
              Expanded(
                child: _buildBody(context, state),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, StationeryState state) {
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
          ],
        ),
      );
    }

    if (state.stationery.isEmpty) {
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

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      itemCount: state.stationery.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = state.stationery[index];
        return StationeryCard(
          item: item,
          onTap: () => _openDetail(item),
        );
      },
    );
  }
}
