import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/commits_entities.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/commits_usecase.dart';

part 'commits_state.dart';

class CommitsCubit extends Cubit<CommitsState> {

  late CommitsUseCase reposUseCase;
  Map<String, List<CommitsEntities>> commitFutures = {};

  CommitsCubit(this.reposUseCase) : super(CommitsInitial());


  Future<void>get_featchCommits(String name) async{
    emit(CommitLoading());
    (await reposUseCase.execute(
        InputCommitUseCase(name))).fold((
        l) =>
    {
      commitFutures[name] ?? [],
      emit(CommitError(l)),
    }, (r) =>
    {
      commitFutures[name]=r,
      emit(CommitLoaded(r)),
    });
  }

  Future<void> getCommits(String name)async{
    if (!commitFutures.containsKey(name)) {
       getCommits(name);
    }else{
      emit(CommitLoaded(commitFutures[name] ?? []));
    }
  }

}
