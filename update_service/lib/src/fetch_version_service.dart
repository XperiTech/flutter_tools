import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

const _playStoreBaseUrl = 'https://play.google.com/store/apps/details';
const _appStoreBaseUrl = 'https://itunes.apple.com/lookup';

abstract class VersionService {
  Future<String?> fetchPlayStoreVersion(String packageName);

  Future<String?> fetchAppStoreVersion(String packageName);

  Future<int?> fetchAppStoreAppId(String packageName);
}

Future<String?> _networkDataProvider(Uri url) async {
  final response = await http.get(url);

  if (response.statusCode != 200) {
    return null;
  } else {
    return response.body;
  }
}

class HttpVersionService implements VersionService {
  HttpVersionService({this.dataProvider = _networkDataProvider});

  // a workaround for testing whether parsing PlayStore HTML fails
  // silently in production but not in development
  @visibleForTesting
  bool isInDebugMode = kDebugMode;

  final Future<String?> Function(Uri url) dataProvider;

  // Manifest from AppStore is used multiple times, so cache it to avoid doing
  // unnecessary HTTP calls
  String? _cachedAppStoreManifest;

  @override
  Future<String?> fetchPlayStoreVersion(String packageName) async {
    final url = Uri.parse('$_playStoreBaseUrl?id=$packageName');
    final response = await dataProvider(url);
    if (response != null) {
      return _extractVersionFromHtml(response);
    }

    return null;
  }

  Future<String?> _extractVersionFromHtml(String response) async {
    final document = parse(response);
    final scripts =
        document.getElementsByTagName('script').map((e) => e.innerHtml);

    for (final script in scripts) {
      try {
        // there's some javascript code surrounding the data we are
        // interested in, so remove it
        const prefixPart = 'data:';
        const suffixString = ", sideChannel: {}});";
        final json = script.substring(
          script.indexOf(prefixPart) + prefixPart.length,
          script.length - suffixString.length,
        );
        final data = jsonDecode(json);

        // these indexes may change in the future, to get them paste [data]
        // into a json file, open that file in IntelliJ IDEA, focus on version
        // string and write down indexes from breadcrumbs
        // https://www.jetbrains.com/help/idea/settings-editor-breadcrumbs.html
        final version = data[1][2][140][0][0][0];
        return version;
      } catch (ex) {
        continue;
      }
    }

    if (isInDebugMode) {
      throw "[HttpVersionService] Failed to extract version from PlayStore's HTML";
    } else {
      return null;
    }
  }

  @override
  Future<String?> fetchAppStoreVersion(String packageName) async {
    _cachedAppStoreManifest ??= await _fetchAppStoreAppManifest(packageName);

    if (_cachedAppStoreManifest != null) {
      return (jsonDecode(_cachedAppStoreManifest!)['results']
          as List<dynamic>)[0]['version'] as String;
    } else {
      return null;
    }
  }

  @override
  Future<int?> fetchAppStoreAppId(String packageName) async {
    _cachedAppStoreManifest ??= await _fetchAppStoreAppManifest(packageName);

    if (_cachedAppStoreManifest != null) {
      return (jsonDecode(_cachedAppStoreManifest!)['results']
          as List<dynamic>)[0]['trackId'] as int;
    } else {
      return null;
    }
  }

  Future<String?> _fetchAppStoreAppManifest(String packageName) async {
    final url = Uri.parse('$_appStoreBaseUrl?bundleId=$packageName');
    return dataProvider(url);
  }
}
