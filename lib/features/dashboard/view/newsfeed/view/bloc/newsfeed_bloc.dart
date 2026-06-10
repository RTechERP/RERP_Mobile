import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../base/bloc/index.dart';
import '../../../../../../../base/network/errors/extension.dart';
import '../../../../../../../common/logger/index.dart';
import '../../data/datasource/models/newsfeed_model.dart';
import '../../data/repository/newsfeed_repo.dart';

part 'newsfeed_event.dart';
part 'newsfeed_state.dart';
part 'newsfeed_bloc.g.dart';
part 'newsfeed_bloc.freezed.dart';

@injectable
class NewsfeedBloc extends BaseBloc<NewsfeedEvent, NewsfeedState> {
  final NewsfeedRepo _newsfeedRepo;
  final LogUtils _log;

  NewsfeedBloc(this._newsfeedRepo, this._log) : super(NewsfeedState.init()) {
    on<NewsfeedEvent>((event, emit) async {
      await event.when(
        init: () => _onInit(emit),
        refresh: () => _loadNewsfeed(emit),
        loadCalendar: () => _loadCalendar(
          emit,
          month: state.selectedMonth,
          year: state.selectedYear,
        ),
        changeCalendarMonth: (month, year) => _loadCalendar(
          emit,
          month: month,
          year: year,
        ),
        refreshCalendar: () => _loadCalendar(
          emit,
          month: state.selectedMonth,
          year: state.selectedYear,
        ),
        loadNewsfeedDetail: (item) => _loadNewsfeedDetail(emit, item: item),
        clearNewsfeedDetail: () => _clearNewsfeedDetail(emit),
      );
    });
  }

  Future<void> _onInit(Emitter<NewsfeedState> emit) async {
    await _loadNewsfeed(emit);
    await _loadCalendar(
      emit,
      month: state.selectedMonth,
      year: state.selectedYear,
      showLoading: false,
    );
  }

  Future<void> _loadNewsfeed(Emitter<NewsfeedState> emit) async {
    emit(state.copyWith(status: BaseStateStatus.loading, message: null));

    final res = await _newsfeedRepo.getNewsfeed();
    await res.fold(
      (err) async {
        _log.logE('❌ Get newsfeed failed: $err');
        emit(
          state.copyWith(
            status: BaseStateStatus.failed,
            message: err.getErrorMessage,
          ),
        );
      },
      (data) async {
        _log.logI('✅ Get newsfeed success - count: ${data.length}');
        emit(
          state.copyWith(
            status: BaseStateStatus.success,
            newsfeeds: data,
            message: null,
          ),
        );
      },
    );
  }

  Future<void> _loadCalendar(
    Emitter<NewsfeedState> emit, {
    required int month,
    required int year,
    bool showLoading = true,
  }) async {
    emit(
      state.copyWith(
        selectedMonth: month,
        selectedYear: year,
        calendarStatus: showLoading ? BaseStateStatus.loading : state.calendarStatus,
        calendarMessage: null,
      ),
    );

    final res = await _newsfeedRepo.getCalendar(month: month, year: year);
    await res.fold(
      (err) async {
        _log.logE('❌ Get holiday calendar failed: $err');
        emit(
          state.copyWith(
            calendarStatus: BaseStateStatus.failed,
            calendarMessage: err.getErrorMessage,
          ),
        );
      },
      (data) async {
        _log.logI(
          '✅ Get holiday calendar success - month: $month/$year - count: ${data.holidays?.length ?? 0}',
        );
        emit(
          state.copyWith(
            calendar: data,
            selectedMonth: month,
            selectedYear: year,
            calendarStatus: BaseStateStatus.success,
            calendarMessage: null,
          ),
        );
      },
    );
  }

  Future<void> _loadNewsfeedDetail(
    Emitter<NewsfeedState> emit, {
    required NewsletterItem item,
  }) async {
    final id = item.id;
    if (id == null) {
      emit(
        state.copyWith(
          selectedNewsfeed: item,
          selectedNewsfeedDetail: null,
          selectedNewsfeedFiles: const [],
          detailStatus: BaseStateStatus.failed,
          detailMessage: 'Không tìm thấy mã bản tin',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        selectedNewsfeed: item,
        selectedNewsfeedDetail: null,
        selectedNewsfeedFiles: const [],
        detailStatus: BaseStateStatus.loading,
        detailMessage: null,
      ),
    );

    final detailRes = await _newsfeedRepo.getNewsfeedDetail(id: id);
    await detailRes.fold(
      (err) async {
        _log.logE('❌ Get newsfeed detail failed: $err');
        emit(
          state.copyWith(
            detailStatus: BaseStateStatus.failed,
            detailMessage: err.getErrorMessage,
          ),
        );
      },
      (detail) async {
        final filesRes = await _newsfeedRepo.getNewsfeedFiles(newsletterId: id);
        await filesRes.fold(
          (err) async {
            _log.logE('❌ Get newsfeed files failed: $err');
            emit(
              state.copyWith(
                selectedNewsfeedDetail: detail,
                selectedNewsfeedFiles: const [],
                detailStatus: BaseStateStatus.success,
                detailMessage: err.getErrorMessage,
              ),
            );
          },
          (files) async {
            _log.logI('✅ Get newsfeed detail success - files: ${files.length}');
            emit(
              state.copyWith(
                selectedNewsfeedDetail: detail,
                selectedNewsfeedFiles: files,
                detailStatus: BaseStateStatus.success,
                detailMessage: null,
              ),
            );
          },
        );
      },
    );
  }

  _clearNewsfeedDetail(Emitter<NewsfeedState> emit) {
    emit(
      state.copyWith(
        selectedNewsfeed: null,
        selectedNewsfeedDetail: null,
        selectedNewsfeedFiles: const [],
        detailStatus: BaseStateStatus.init,
        detailMessage: null,
      ),
    );
  }
}
