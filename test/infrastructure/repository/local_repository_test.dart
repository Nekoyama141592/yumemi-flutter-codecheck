import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/repository/local_repository.dart';

void main() {
  group('LocalRepository', () {
    late LocalRepository localRepository;
    late SharedPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      localRepository = LocalRepository(prefs);
    });

    group('getIsDarkMode', () {
      test('returns true when no value is stored', () {
        final result = localRepository.getIsDarkMode();
        expect(result, true);
      });

      test('returns stored value when value exists', () async {
        await prefs.setBool('isDarkMode', false);
        
        final result = localRepository.getIsDarkMode();
        expect(result, false);
      });

      test('returns stored true value when value exists', () async {
        await prefs.setBool('isDarkMode', true);
        
        final result = localRepository.getIsDarkMode();
        expect(result, true);
      });
    });

    group('saveIsDarkMode', () {
      test('saves true value correctly', () async {
        await localRepository.saveIsDarkMode(true);
        
        final result = prefs.getBool('isDarkMode');
        expect(result, true);
      });

      test('saves false value correctly', () async {
        await localRepository.saveIsDarkMode(false);
        
        final result = prefs.getBool('isDarkMode');
        expect(result, false);
      });

      test('overwrites existing value', () async {
        await prefs.setBool('isDarkMode', true);
        
        await localRepository.saveIsDarkMode(false);
        
        final result = prefs.getBool('isDarkMode');
        expect(result, false);
      });
    });

    group('integration tests', () {
      test('save and get work together', () async {
        await localRepository.saveIsDarkMode(false);
        final result = localRepository.getIsDarkMode();
        expect(result, false);
      });

      test('multiple save and get operations', () async {
        await localRepository.saveIsDarkMode(true);
        expect(localRepository.getIsDarkMode(), true);
        
        await localRepository.saveIsDarkMode(false);
        expect(localRepository.getIsDarkMode(), false);
        
        await localRepository.saveIsDarkMode(true);
        expect(localRepository.getIsDarkMode(), true);
      });
    });
  });
}