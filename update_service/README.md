### update_service

[![build](https://github.com/XperiTech/flutter_tools/actions/workflows/test.yml/badge.svg)](https://github.com/XperiTech/flutter_tools/actions/workflows/test.yml)
[![pub package](https://img.shields.io/pub/v/update_service.svg)](https://pub.dev/packages/update_service)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

Utility service that checks whether an update is available according to [semantic versioning](https://semver.org).

## Getting started

Add a dependency to pubspec.yaml:

```yaml
dependencies:
  update_service:
    git:
      url: https://github.com/XperiTech/flutter_tools
      path: update_service
```

## Usage

```dart
import 'package:flutter/foundation.dart';
import 'package:update_service/update_service.dart';

void main() async {
  final updateService = UpdateService.createDefault();

  final updateStatus = await updateService.checkStatus(skipUpdate: kDebugMode);

  updateStatus.when(
    required: (local, published) =>
        // major version changed
        // e.g. 1.0.0 -> 2.0.0
        updateService.openStore(),
    optional: (local, published) =>
        // minor or patch version changed
        // e.g. 1.0.0 -> 1.0.1
        //   or 1.0.0 -> 1.1.0
        print('update optional'),
    upToDate: ()
        // the app is up to date, don't do anything
        {},
    unknown: ()
        // can't determine if an update is available
        // some examples of this are when there's no internet connection
        // or when no app with the same package name was found
        {},
  );
}
```

## Migration to 2.0.0

### Usage
```dart
import 'package:flutter/foundation.dart';
import 'package:update_service/update_service.dart';

void main() async {
  final updateService = UpdateService.createDefault();


  final updateStatus = await updateService.checkStatus(
    skipUpdate: kDebugMode,
    // [Optional] Specify the minimum required version for a force update
    forceUpdateVersion: '2.1.0',
  );

  updateStatus.when(
    required: (local, published) =>
        // Required update for versions lower than 2.1.0
        updateService.openStore(),
    optional: (local, published) =>
        // Update is optional if no forced version requirement is met
        // e.g. 1.0.0 -> 1.0.1
        //   or 1.0.0 -> 1.1.0
        print('update optional'),
    upToDate: ()
        // The app is up to date with the latest or meets the required version
        {},
    unknown: ()
        // Can't determine if an update is available due to network or other issues
        {},
  );
}