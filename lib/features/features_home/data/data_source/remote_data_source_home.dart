
import 'dart:convert';

import 'package:mvvm_project/features/features_home/data/network/apiHome.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_repos.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import '../../../../core/constant.dart';
abstract class RemoteDataSourceHome {


   Future<List<ModelRepos>> getRepos();

}

 class RemoteDataSourceHomeImplementer implements RemoteDataSourceHome {
  final ApiHome _appServiceClient;

  RemoteDataSourceHomeImplementer(this._appServiceClient);

  @override
  Future<List<ModelRepos>> getRepos() async{
    return await _appServiceClient.getRepos();
  }


}