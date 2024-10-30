import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';


class ReposUseCase implements BaseCase<InputUseCase,List<ReposEntities>> {
  final RepositoryHome _repository;

  ReposUseCase(this._repository);

  @override
  Future<Either<Failure,List<ReposEntities>>> execute(InputUseCase input) async {
    return await _repository.getRepos();
  }
}

class InputUseCase{

}
