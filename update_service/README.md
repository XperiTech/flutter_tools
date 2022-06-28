### update_service

Utility service that checks whether an update is available

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
      updateService.openStore();
      break;
    case UpdateStatus.optional:
      print('update optional');
      break;
    case UpdateStatus.upToDate:
    case UpdateStatus.unknown:
      return;
  }
}
```