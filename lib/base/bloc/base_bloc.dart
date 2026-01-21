import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/local_data/index.dart';
import '../../di/injection.dart';
import 'base_bloc_state.dart';

abstract class BaseBloc<E, S extends BaseBlocState> extends Bloc<E, S> {
  BaseBloc(super.initialState);
  final localPref = getIt<LocalStorage>();
}
