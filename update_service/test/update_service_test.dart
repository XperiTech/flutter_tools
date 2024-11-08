import 'dart:async';

import 'package:test/test.dart';
import 'package:update_service/src/fetch_version_service.dart';
import 'package:update_service/src/package_info_service.dart';
import 'package:update_service/src/update_service.dart';
import 'package:update_service/src/update_status.dart';

void main() async {
  group('UpdateService', () {
    for (final platform in [Platform.ios, Platform.android]) {
      group('on ${platform.name}', () {
        test('detects required update if forceUpdateVersion is set', () async {
          final service = _createUpdateService(
            localVersion: '1.9.0',
            publishedVersion: '2.0.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(forceUpdateVersion: '1.9.5'),
            UpdateStatus.required('1.9.0', '2.0.0'),
          );
        });

        test(
            'detects optional if forceUpdateVersion is invalid -> contrinue as optional',
            () async {
          final service = _createUpdateService(
            localVersion: '1.9.0',
            publishedVersion: '2.0.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(forceUpdateVersion: '19.5'),
            UpdateStatus.optional('1.9.0', '2.0.0'),
          );
        });

        test(
            'detects upToDate if forceUpdateVersion is lower then local and published',
            () async {
          final service = _createUpdateService(
            localVersion: '1.9.0',
            publishedVersion: '1.9.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(forceUpdateVersion: '1.8.0'),
            UpdateStatus.upToDate(),
          );
        });

        test(
            'detects require if forceUpdateVersion is higher then local but lower published',
            () async {
          final service = _createUpdateService(
            localVersion: '1.9.0',
            publishedVersion: '2.9.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(forceUpdateVersion: '2.0.0'),
            UpdateStatus.required('1.9.0', '2.9.0'),
          );
        });

        test(
            'detects optional if forceUpdateVersion is null and major version is higher',
            () async {
          final service = _createUpdateService(
            localVersion: '1.0.0',
            publishedVersion: '2.0.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(forceUpdateVersion: null),
            UpdateStatus.optional('1.0.0', '2.0.0'),
          );
        });

        test('detects optional update when minor version is higher', () async {
          final service = _createUpdateService(
            localVersion: '1.3.0',
            publishedVersion: '1.4.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(),
            UpdateStatus.optional('1.3.0', '1.4.0'),
          );
        });

        test('detects optional update when patch version is higher', () async {
          final service = _createUpdateService(
            localVersion: '1.3.0',
            publishedVersion: '1.3.1',
            platform: platform,
          );

          expect(
            await service.checkStatus(),
            UpdateStatus.optional('1.3.0', '1.3.1'),
          );
        });

        test(
            'detects optional update when minor (two digits) version is higher',
            () async {
          final service = _createUpdateService(
            localVersion: '1.9.9',
            publishedVersion: '1.10.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(),
            UpdateStatus.optional('1.9.9', '1.10.0'),
          );
        });

        test('returns upToDate when versions are equal', () async {
          final service = _createUpdateService(
            localVersion: '1.3.0',
            publishedVersion: '1.3.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(),
            UpdateStatus.upToDate(),
          );
        });

        test('returns upToDate when published minor is lower', () async {
          final service = _createUpdateService(
            localVersion: '1.3.0',
            publishedVersion: '1.2.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(),
            UpdateStatus.upToDate(),
          );
        });

        test('returns upToDate when published patch is lower', () async {
          final service = _createUpdateService(
            localVersion: '1.3.1',
            publishedVersion: '1.3.0',
            platform: platform,
          );

          expect(
            await service.checkStatus(),
            UpdateStatus.upToDate(),
          );
        });

        test(
            'returns upToDate when published minor is lower but patch is higher',
            () async {
          final service = _createUpdateService(
            localVersion: '1.3.0',
            publishedVersion: '1.2.1',
            platform: platform,
          );

          expect(
            await service.checkStatus(),
            UpdateStatus.upToDate(),
          );
        });

        test('returns unknown when version string is malformed', () async {
          final service = _createUpdateService(
            localVersion: '1.3.0',
            publishedVersion: 'broken version string',
            platform: platform,
          );

          expect(
            await service.checkStatus(),
            UpdateStatus.unknown(),
          );
        });
      });
    }

    test('on other platforms returns unknown', () async {
      final service = _createUpdateService(
        localVersion: '1.3.0',
        publishedVersion: '1.4.0',
        platform: Platform.other,
      );

      expect(
        await service.checkStatus(),
        UpdateStatus.unknown(),
      );
    });
  });
}

UpdateService _createUpdateService({
  required String localVersion,
  required String publishedVersion,
  required Platform platform,
}) =>
    UpdateService(
      MockFetchVersionService(publishedVersion),
      MockPackageInfoService(localVersion),
      platform,
    );

class MockPackageInfoService extends PackageInfoService {
  MockPackageInfoService(this.version);

  final String version;

  @override
  Future<String?> getAppVersion() async => version;

  @override
  Future<String?> getPackageName() async => 'test.package.name';
}

class MockFetchVersionService implements VersionService {
  MockFetchVersionService(this.version);

  final String version;

  @override
  Future<String?> fetchPlayStoreVersion(String packageName) async => version;

  @override
  Future<String?> fetchAppStoreVersion(String packageName) async => version;

  @override
  Future<int?> fetchAppStoreAppId(String packageName) =>
      throw UnimplementedError();
}
