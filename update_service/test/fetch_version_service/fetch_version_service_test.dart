import 'dart:io';

import 'package:test/test.dart';
import 'package:update_service/src/fetch_version_service.dart';

final appStoreOutput =
    File('test/fetch_version_service/appstore.out').readAsStringSync();

// test PlayStore HTML parsing on a bunch of different apps
final playStoreElveguidenOutput =
    File('test/fetch_version_service/playstore_elveguiden.out')
        .readAsStringSync();
final playStoreCampioOutput =
    File('test/fetch_version_service/playstore_campio.out').readAsStringSync();
final playStoreFirefoxOutput =
    File('test/fetch_version_service/playstore_firefox.out').readAsStringSync();

void main() async {
  group('HttpVersionService', () {
    test('extracts version from AppStore', () async {
      var dataProviderCallCounter = 0;

      final service = HttpVersionService(
        dataProvider: (_) async {
          dataProviderCallCounter++;
          return appStoreOutput;
        },
      );

      expect(await service.fetchAppStoreVersion('com.elvefiske.elveguiden'),
          '3.6.13');
      expect(await service.fetchAppStoreAppId('com.elvefiske.elveguiden'),
          1464552726);

      // make sure there is only one HTTP call made
      expect(dataProviderCallCounter, 1);
    });

    group('extracts version from PlayStore', () {
      test('for Elveguiden', () async {
        final service = HttpVersionService(
          dataProvider: (url) async => url.toString() ==
                  'https://play.google.com/store/apps/details?id=no.elveguiden.app'
              ? playStoreElveguidenOutput
              : null,
        );

        expect(
            await service.fetchPlayStoreVersion('no.elveguiden.app'), '3.6.13');
      });

      test('for Campio', () async {
        final service = HttpVersionService(
          dataProvider: (_) async => playStoreCampioOutput,
        );

        expect(await service.fetchPlayStoreVersion('com.campio.campioapp'),
            '2.2.4');
      });

      test('for Firefox', () async {
        final service = HttpVersionService(
          dataProvider: (_) async => playStoreFirefoxOutput,
        );

        expect(await service.fetchPlayStoreVersion('org.mozilla.firefox'),
            '101.2.0');
      });
    });

    test('fails silently when in production', () async {
      final service = HttpVersionService(
        dataProvider: (_) async => 'invalid HTML',
      )..isInDebugMode = false;

      expect(
          service.fetchPlayStoreVersion('no.elveguiden.app'), completion(null));
    });

    test('fails explicitly when in debug', () async {
      final service = HttpVersionService(
        dataProvider: (_) async => 'invalid HTML',
      )..isInDebugMode = true;

      expect(service.fetchPlayStoreVersion('no.elveguiden.app'),
          throwsA(anything));
    });
  });
}
