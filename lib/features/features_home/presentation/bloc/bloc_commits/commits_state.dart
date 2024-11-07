part of 'commits_cubit.dart';

@immutable
abstract class CommitsState extends Equatable {

  const CommitsState();

  @override
  List<Object?> get props => [];
}

final class CommitsInitial extends CommitsState {}
final class CommitLoading extends CommitsState {}
final class CommitLoaded extends CommitsState {
  List<CommitsEntities> commit=[];

  CommitLoaded(this.commit);
}
final class CommitError extends CommitsState {
  late Failure failure;
  CommitError(this.failure);
}



