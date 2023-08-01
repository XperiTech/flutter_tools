import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_status.freezed.dart';

@freezed
class UpdateStatus with _$UpdateStatus {
  const factory UpdateStatus.required(
    String currentVersion,
    String newVersion,
  ) = UpdateRequired;
  const factory UpdateStatus.optional(
    String currentVersion,
    String newVersion,
  ) = UpdateOptional;

  const factory UpdateStatus.upToDate() = UpdateUpToDate;
  const factory UpdateStatus.unknown() = UpdateUnknown;
}
