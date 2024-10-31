import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';



@GenerateMocks([InternetConnectionChecker])
import 'package:flutter_test/flutter_test.dart';
import 'network_info_test.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });







  group('isConnected', () {
    test('should return true when connected to the internet', () async {
      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);

      final result = await networkInfo.isConnected;

      expect(result, true);
      verify(mockInternetConnectionChecker.hasConnection).called(1);
    });

    test('should return false when not connected to the internet', () async {
      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => false);

      final result = await networkInfo.isConnected;

      expect(result, false);
      verify(mockInternetConnectionChecker.hasConnection).called(1);
    });
  });
}

