import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/repos_usecase.dart';

part 'repos_state.dart';

class ReposCubit extends Cubit<ReposState> {

  late ReposUseCase reposUseCase;

  ReposCubit(this.reposUseCase) : super(ReposLoading());

  Future<void>get_featchData() async{
    emit(ReposLoading());
    (await reposUseCase.execute(
        InputUseCase())).fold((
        l) =>
    {
      emit(ReposError(l)),


    }, (r) =>
    {
      emit(ReposLoaaded(r)),

    });
  }


}
