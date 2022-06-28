import 'package:package_info_plus/package_info_plus.dart';

abstract class PackageInfoService {
  Future<String?> getAppVersion();

  Future<String?> getPackageName();
}

class BasePackageInfoService implements PackageInfoService {
  @override
  Future<String?> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Future<String?> getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }
}
