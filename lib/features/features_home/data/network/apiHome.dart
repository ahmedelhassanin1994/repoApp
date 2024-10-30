
import 'package:dio/dio.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_repos.dart';
import 'package:retrofit/retrofit.dart';

part 'apiHome.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ApiHome {
  factory ApiHome(Dio dio, {String baseUrl}) = _ApiHome;


  @GET("users/mralexgray/repos")
  Future<List<ModelRepos>> getRepos();
}
