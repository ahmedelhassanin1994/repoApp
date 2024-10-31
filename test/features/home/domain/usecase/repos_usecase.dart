import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/repos_usecase.dart';

import 'repos_usecase.mocks.dart';


@GenerateMocks([RepositoryHome])
void main() {
  late MockRepositoryHome mockRepositoryHome;
  late ReposUseCase reposUseCase;

  setUp(() {
    mockRepositoryHome = MockRepositoryHome();
    reposUseCase = ReposUseCase(mockRepositoryHome);
  });

  test('should return a list of ReposEntities on success', () async {
    // Arrange
    when(mockRepositoryHome.getRepos()).thenAnswer(
          (_) async =>
          Right([
            ReposEntities(1, "Repo 1", "full_name", "description"),
            ReposEntities(2, "Repo 2", "full_name", "description"),
          ]),
    );

    // Act
    final result = await reposUseCase.execute(InputUseCase());

    // Assert
    expect(result, isA<Right<Failure, List<ReposEntities>>>());

  });

    test('should return a Failure on error', () async {
      // Arrange
      when(mockRepositoryHome.getRepos()).thenAnswer(
            (_) async => Left(DataSource.NI_INTERNET_CONNECTION.getFailure()),
      );

      // Act
      final result = await reposUseCase.execute(InputUseCase());

      // Assert
      expect(result, isA<Left<Failure, List<ReposEntities>>>());
    });

}