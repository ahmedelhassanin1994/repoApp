import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/commits_entities.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';


class CommitsUseCase implements BaseCase<InputCommitUseCase,List<CommitsEntities>> {
  final RepositoryHome _repository;

  CommitsUseCase(this._repository);

  @override
  Future<Either<Failure,List<CommitsEntities>>> execute(InputCommitUseCase input) async {
    return await _repository.getCommits(input.name.toString());
  }
}

class InputCommitUseCase{
  String? name;

  InputCommitUseCase(this.name);
}
