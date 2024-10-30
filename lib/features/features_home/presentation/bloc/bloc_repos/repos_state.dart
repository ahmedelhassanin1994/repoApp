part of 'repos_cubit.dart';

@immutable
abstract class ReposState extends Equatable {
  const ReposState();

  @override
  List<Object?> get props => [];
}

final class ReposInitial extends ReposState {}
final class ReposLoading extends ReposState {}
final class ReposLoaaded extends ReposState {
  List<ReposEntities> repos=[];

  ReposLoaaded(this.repos);
}
final class ReposError extends ReposState {
  late Failure failure;

  ReposError(this.failure);
}