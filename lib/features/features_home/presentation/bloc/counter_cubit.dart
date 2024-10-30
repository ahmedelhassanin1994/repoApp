import 'package:bloc/bloc.dart';
import 'package:mvvm_project/core/constant.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void CurentIndex(int index){

      emit(index);
  }
}