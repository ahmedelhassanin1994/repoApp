

// to convert the response into an non nullable object (model)


import 'package:mvvm_project/core/common/extensions.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_repos.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';

const EMPTY="";
const ZERO=0;
const STATUS=false;
const Double=0.0;



extension ReposDataMapper on ModelRepos?{
  ReposEntities toDomain(){

    return ReposEntities(this!.id.orZero(),this!.name.orEmpty(),this!.fullName.orEmpty(),this!.description.orEmpty());
  }

}






