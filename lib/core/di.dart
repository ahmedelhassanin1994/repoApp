import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mvvm_project/core/common/network/dio_factory.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/network/apiHome.dart';
import 'package:mvvm_project/features/features_home/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/features_home/data/repository/repositoryHome_impl.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/commits_usecase.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/repos_usecase.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_commits/commits_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_repos/repos_cubit.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/counter_cubit.dart';


final instance = GetIt.instance;

Future<void> initAppModule() async {

  // networl instance
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<ApiHome>(() => ApiHome(dio));





  instance.registerLazySingleton<RemoteDataSourceHome>(
      () => RemoteDataSourceHomeImplementer(instance()));



  // local data source
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementer());



  // repository

  instance.registerLazySingleton<RepositoryHome>(
      () => RepositoryHomeImpl(instance(), instance(), instance()));




  //Infrastructure
  instance.registerLazySingleton<Dio>(() => Dio());

  HomeModule();

}

HomeModule() {
  if (!GetIt.I.isRegistered<ReposUseCase>()) {
    instance.registerFactory<ReposUseCase>(() => ReposUseCase(instance()));
    instance.registerFactory<CommitsUseCase>(() => CommitsUseCase(instance()));
    instance.registerFactory<ReposCubit>(() => ReposCubit(instance()));
    instance.registerFactory<CommitsCubit>(() => CommitsCubit(instance()));
    instance.registerFactory<CounterCubit>(() => CounterCubit());


  }
}





restetAllModule() {
  instance.reset(dispose: true);
  initAppModule();
}

