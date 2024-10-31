import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/repos_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/repos_entities.dart';
import 'package:mvvm_project/features/features_home/presentation/bloc/bloc_repos/repos_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'repos_cubitTest.mocks.dart';


@GenerateMocks([ReposUseCase])
void main() {
  late MockReposUseCase mockReposUseCase;
  late ReposCubit reposCubit;

  setUp(() {
    mockReposUseCase = MockReposUseCase();
    reposCubit = ReposCubit(mockReposUseCase);
  });

  test('initial state is ReposInitial', () {
    expect(reposCubit.state, ReposInitial());
  });

  group('get_featchData', () {
    final repos = [
      ReposEntities(1, "Repo 1", "full_name", "description"),
      ReposEntities(2, "Repo 2", "full_name", "description"),
    ];

    blocTest<ReposCubit, ReposState>(
      'emits [ReposLoading, ReposLoaded] when data fetch is successful',
      build: () => reposCubit,
      act: (cubit) {
        when(mockReposUseCase.execute(any)).thenAnswer((_) async => Right(repos));
        cubit.get_featchData();
      },
      expect: () => [
        ReposLoading(),
        ReposLoaaded(repos),
      ],
    );

    blocTest<ReposCubit, ReposState>(
      'emits [ReposLoading, ReposError] when data fetch fails',
      build: () => reposCubit,
      act: (cubit) {
        when(mockReposUseCase.execute(any)).thenAnswer((_) async => Left(DataSource.NI_INTERNET_CONNECTION.getFailure()));
        cubit.get_featchData();
      },
      expect: () => [
        ReposLoading(),
        ReposError(DataSource.NI_INTERNET_CONNECTION.getFailure()),
      ],
    );
  });
}