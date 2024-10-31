import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/data/model/model_cache.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/mapper/mapper_home.dart';
import 'package:mvvm_project/features/features_home/data/repository/repositoryHome_impl.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_repos.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import '../../../../core_test/network_info_test.mocks.dart';
import 'repositoryHome_impl.mocks.dart';



@GenerateMocks([RemoteDataSourceHome,NetworkInfo,LocalDataSource])
void main() {
  late MockRemoteDataSourceHome mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late RepositoryHomeImpl repository;



  setUp(() {
    mockRemoteDataSource = MockRemoteDataSourceHome();
    mockLocalDataSource = MockLocalDataSource();
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
    repository = RepositoryHomeImpl(mockRemoteDataSource, networkInfo, mockLocalDataSource);

  });

  group('getRepos', () {
    final testRepos = [
      ModelRepos(id: 1, name: 'Repo 1'),
      ModelRepos(id: 2, name: 'Repo 2'),
    ];
    final List<ReposEntities> expectedEntities =
    testRepos.map((e) => e.toDomain()).toList();

    test('should return repos from remote data source when online', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getRepos()).thenAnswer((_) async => testRepos);

      // Act
      final result = await repository.getRepos();

      final resultList = (result as Right<Failure, List<ReposEntities>>).value;
      expect(resultList.length, expectedEntities.length);
      for (var i = 0; i < expectedEntities.length; i++) {
        expect(resultList[i].id, expectedEntities[i].id);
        expect(resultList[i].name, expectedEntities[i].name);
      }

      verify(mockRemoteDataSource.getRepos()).called(1);
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return repos from local data source when offline', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      final modelCache = Model_Cache(Constant.localKey, jsonEncode(testRepos));

      when(mockLocalDataSource.getCache()).thenAnswer((_) async => modelCache);

      // Act
      final result = await repository.getRepos();

// Update your expect statement
      expect(result, isA<Right<Failure, List<ReposEntities>>>());
     // expect(result, expectedEntities);


      verify(mockLocalDataSource.getCache()).called(1);
      verifyNoMoreInteractions(mockLocalDataSource);
    });

    test('should return Failure when remote call fails', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getRepos()).thenThrow(Exception('Failed to fetch'));

      // Act
      final result = await repository.getRepos();

      // Assert
      expect(result, isA<Left<Failure, List<ReposEntities>>>());
      verify(mockRemoteDataSource.getRepos()).called(1);
    });

    test('should return Failure when local data source fails', () async {
      // Arrange
      when(networkInfo.isConnected).thenAnswer((_) async => false);
      when(mockLocalDataSource.getCache()).thenThrow(Exception('No cache'));

      // Act
      final result = await repository.getRepos();

      // Assert
      expect(result, isA<Left<Failure, List<ReposEntities>>>());
      verify(mockLocalDataSource.getCache()).called(1);
    });
  });
}
