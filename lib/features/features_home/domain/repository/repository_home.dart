import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/commits_entities.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';


abstract class RepositoryHome {

   Future<Either<Failure,List<ReposEntities>>> getRepos();
   Future<Either<Failure,List<CommitsEntities>>> getCommits(String name);
}
