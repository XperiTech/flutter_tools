### update_service

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
import 'package:update_service/update_service.dart';

void checkForUpdate() async {
  final updateService = UpdateService.createDefault();

  final updateStatus = await updateService.checkStatus(skipUpdate: kDebugMode);
  switch (updateStatus) {
    case UpdateStatus.required:
      // major version changed
      // e.g. 1.0.0 -> 2.0.0
      updateService.openStore();
      break;
    case UpdateStatus.optional:
      // minor or patch version changed
      // e.g. 1.0.0 -> 1.0.1
      //   or 1.0.0 -> 1.1.0
      print('update optional');
      break;
    case UpdateStatus.upToDate:
      // the app is up to date, don't do anything
    case UpdateStatus.unknown:
      // can't determine if an update is available
      // some examples of this are when there's no internet connection
      // or when no app with the same package name was found
      return;
  }
}
```