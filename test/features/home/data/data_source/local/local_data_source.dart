import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_project/core/common/data/model/model_cache.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/data_source/local_data_source.dart';
import 'package:hive/hive.dart';
import 'local_data_source.mocks.dart';
class MockLocalDataSource extends LocalDataSourceImplementer {
  final MockBox<Model_Cache> mockBox;

  MockLocalDataSource(this.mockBox);

  @override
  Future<Box<Model_Cache>> Openbox() async => mockBox;
}
@GenerateMocks([Box])
void main() {
  late MockLocalDataSource localDataSource;
  late MockBox<Model_Cache> mockBox;

  setUp(() {
    mockBox = MockBox<Model_Cache>();
    localDataSource = MockLocalDataSource(mockBox);
  });

  group('AddCache', () {
    test('should add a Model_Cache to the box', () async {
      final modelCache = Model_Cache("testKey","testValue");

      // Stub the add method
      when(mockBox.add(modelCache)).thenAnswer((_) async => 1);

      await localDataSource.AddCache(modelCache);

      verify(mockBox.add(modelCache)).called(1);
    });
  });

  group('deleteLocal', () {
    test('should delete an item by title from the box', () async {
      final modelCache = Model_Cache("testKey","testValue");
      final deliveriesMap = {1: modelCache};

      when(mockBox.toMap()).thenReturn(deliveriesMap);

      await localDataSource.deleteLocal("testKey");

      verify(mockBox.delete(1)).called(1);
    });
  });

  group('getCache', () {
    test('should return a Model_Cache with the specified key', () async {
      final modelCache = Model_Cache(Constant.localKey,  "testValue");
      when(mockBox.values).thenReturn([modelCache]);

      final result = await localDataSource.getCache();

      expect(result, modelCache);


      
    });
  });
}