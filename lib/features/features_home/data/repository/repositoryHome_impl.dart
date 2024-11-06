

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/data/model/model_cache.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/mapper/mapper_home.dart';
import 'package:mvvm_project/features/features_home/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_repos.dart';
import 'package:mvvm_project/features/features_home/domain/entities/commits_entities.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';


class RepositoryHomeImpl extends RepositoryHome {
  late RemoteDataSourceHome _remoteDataSource;
  late LocalDataSource localDataSource;
  late NetworkInfo _networkInfo;

  RepositoryHomeImpl(this._remoteDataSource, this._networkInfo, this.localDataSource);



  @override
  Future<Either<Failure,List<ReposEntities>>> getRepos() async{
    // TODO: implement categories
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getRepos();

        Model_Cache modelcache=new Model_Cache(Constant.localKey,jsonEncode(response));
        localDataSource.AddCache(modelcache);
        List<ReposEntities>? recipes=(response?.map((e) => e.toDomain()) ?? Iterable.empty()).cast<ReposEntities>().toList();
        return Right(recipes);

      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {

      try{
        final data=await localDataSource.getCache();
        List  result = json.decode(data.value);
        final response=result.map((data) => ModelRepos.fromJson(data)).toList();
        List<ReposEntities>? recipes=(response!.map((e) => e.toDomain()) ?? Iterable.empty()).cast<ReposEntities>().toList();
        return Right(recipes);

      }catch(e){
        return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
      }


  }

  }

  @override
  Future<Either<Failure, List<CommitsEntities>>> getCommits(String name) async{
    // TODO: implement getCommits

    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getCommits(name);
        List<CommitsEntities>? recipes=(response?.map((e) => e.toDomain()) ?? Iterable.empty()).cast<CommitsEntities>().toList();
        return Right(recipes);

      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());

    }
  }

}
