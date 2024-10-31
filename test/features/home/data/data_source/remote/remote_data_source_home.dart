import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/network/apiHome.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_repos.dart';

import 'remote_data_source_home.mocks.dart';



@GenerateMocks([ApiHome])
void main() {
  late RemoteDataSourceHomeImplementer remoteDataSource;
  late MockApiHome mockApiHome;

  setUp(() {
    mockApiHome = MockApiHome();
    remoteDataSource = RemoteDataSourceHomeImplementer(mockApiHome);
  });

  group('getRepos', () {
    test('should return a list of ModelRepos when ApiHome.getRepos is called', () async {
      // Arrange: Set up mock return value
      final tRepos = [
        ModelRepos(id: 1, name: "Repo 1", fullName: "Full Repo 1"),
        ModelRepos(id: 2, name: "Repo 2", fullName: "Full Repo 2")
      ];
      when(mockApiHome.getRepos()).thenAnswer((_) async => tRepos);

      // Act: Call the method
      final result = await remoteDataSource.getRepos();

      // Assert: Check if the result is as expected
      expect(result, tRepos);
      verify(mockApiHome.getRepos()).called(1);
    });

    test('should throw an Exception when ApiHome.getRepos throws an error', () async {
      // Arrange: Set up mock to throw an exception
      when(mockApiHome.getRepos()).thenThrow(Exception("Failed to fetch repos"));

      // Act & Assert: Verify that the exception is thrown
      expect(() => remoteDataSource.getRepos(), throwsException);
      verify(mockApiHome.getRepos()).called(1);
    });
  });
}
