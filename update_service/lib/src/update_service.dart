import 'dart:developer';
import 'dart:io' as io;

import 'package:url_launcher/url_launcher.dart';

import '../update_service.dart';
import 'fetch_version_service.dart';
import 'package_info_service.dart';

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
      return UpdateStatus.upToDate();
    }

    try {
      return await _checkStatus();
    } catch (ex, s) {
      log('[update_service] Failed to check update status',
          error: ex, stackTrace: s);
      return UpdateStatus.unknown();
    }
  }

  Future<UpdateStatus> _checkStatus() async {
    final localVersion = await _packageInfoService.getAppVersion();
    final packageName = await _packageInfoService.getPackageName();
    if (packageName == null) {
      return UpdateStatus.unknown();
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
      return UpdateStatus.unknown();
    }

    return _computeUpdateStatus(localVersion, publishedVersion);
  }

  UpdateStatus _computeUpdateStatus(
      String localVersion, String publishedVersion) {
    final [pubMajor, pubMinor, pubPatch] =
        publishedVersion.split('.').map(int.parse).toList();
    final [localMajor, localMinor, localPatch] =
        localVersion.split('.').map(int.parse).toList();

    if (pubMajor > localMajor) {
      return UpdateStatus.required(localVersion, publishedVersion);
    } else if (pubMinor > localMinor ||
        (pubPatch > localPatch && pubMinor == localMinor)) {
      return UpdateStatus.optional(localVersion, publishedVersion);
    } else {
      return UpdateStatus.upToDate();
    }
  }

  void openStore() async {
    final packageName = await _packageInfoService.getPackageName();
    if (packageName == null) {
      return;
    }

    switch (_platform) {
      case Platform.android:
        final openedPlayStoreApp = await _launchPlayStoreAppUri(packageName) //
            .onError((_, __) => false);

        if (!openedPlayStoreApp) {
          _launchPlayStoreWebUri(packageName);
        }
        break;
      case Platform.ios:
        await _launchAppStoreUri(packageName);
        break;
      case Platform.other:
        throw UnimplementedError();
    }
  }

  Future<void> _launchAppStoreUri(String packageName) async {
    launchUrl(
      Uri.parse(
        'https://apps.apple.com/app/${packageName.split(".").last}/id${await _versionService.fetchAppStoreAppId(packageName)}',
      ),
    );
  }

  Future<bool> _launchPlayStoreAppUri(String packageName) =>
      launchUrl(Uri.parse('market://details?id=$packageName'));

  Future<bool> _launchPlayStoreWebUri(String packageName) => launchUrl(
      Uri.parse('https://play.google.com/store/apps/details?id=$packageName'));
}
