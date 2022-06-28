import 'dart:io' as io;

import 'package:url_launcher/url_launcher.dart';

import 'fetch_version_service.dart';
import 'package_info_service.dart';

enum UpdateStatus { required, optional, upToDate, unknown }

enum Platform { android, ios, other }

class UpdateService {
  UpdateService(this._versionService, this._packageInfoService, this._platform);

  final VersionService _versionService;
  final PackageInfoService _packageInfoService;
  final Platform _platform;

  factory UpdateService.createDefault() {
    final Platform platform;
    if (io.Platform.isIOS) {
      platform = Platform.ios;
    } else if (io.Platform.isAndroid) {
      platform = Platform.android;
    } else {
      platform = Platform.other;
    }

    return UpdateService(
      HttpVersionService(),
      BasePackageInfoService(),
      platform,
    );
  }

  Future<UpdateStatus> checkStatus({bool? skipUpdate}) async {
    if (skipUpdate == true) {
      return UpdateStatus.upToDate;
    }

    try {
      return await _checkStatus();
    } catch (ex) {
      return UpdateStatus.unknown;
    }
  }

  Future<UpdateStatus> _checkStatus() async {
    final localVersion = await _packageInfoService.getAppVersion();
    final packageName = await _packageInfoService.getPackageName();
    if (packageName == null) {
      return UpdateStatus.unknown;
    }

    final String? publishedVersion;
    switch (_platform) {
      case Platform.android:
        publishedVersion =
            await _versionService.fetchPlayStoreVersion(packageName);
        break;
      case Platform.ios:
        publishedVersion =
            await _versionService.fetchAppStoreVersion(packageName);
        break;
      case Platform.other:
        throw UnimplementedError();
    }

    if (publishedVersion == null || localVersion == null) {
      return UpdateStatus.unknown;
    }

    return _computeUpdateStatus(localVersion, publishedVersion);
  }

  UpdateStatus _computeUpdateStatus(
      String localVersion, String publishedVersion) {
    final publishedVersionParts =
        publishedVersion.split('.').map(int.parse).toList();
    final publishedMajor = publishedVersionParts[0];
    final publishedMinor = publishedVersionParts[1];
    final publishedPatch = publishedVersionParts[2];

    final localVersionParts = localVersion.split('.').map(int.parse).toList();
    final localMajor = localVersionParts[0];
    final localMinor = localVersionParts[1];
    final localPatch = localVersionParts[2];

    if (publishedMajor > localMajor) {
      return UpdateStatus.required;
    } else if (publishedMinor > localMinor || publishedPatch > localPatch) {
      return UpdateStatus.optional;
    } else {
      return UpdateStatus.upToDate;
    }
  }

  void openStore() async {
    final packageName = await _packageInfoService.getPackageName();
    if (packageName == null) {
      return;
    }

    switch (_platform) {
      case Platform.android:
        launchUrl(
          Uri.parse(
            'https://play.google.com/store/apps/details?id=$packageName',
          ),
        );
        break;
      case Platform.ios:
        launchUrl(
          Uri.parse(
            'https://apps.apple.com/app/${packageName.split(".").last}/id${await _versionService.fetchAppStoreAppId(packageName)}',
          ),
        );
        break;
      case Platform.other:
        throw UnimplementedError();
    }
  }
}
