class AppVersion implements Comparable<AppVersion> {
  final int major;
  final int minor;
  final int patch;

  AppVersion._(this.major, this.minor, this.patch);

  factory AppVersion.parse(String version) {
    final parts = version.split('.').map(int.parse).toList();
    if (parts.length != 3) {
      throw FormatException(
        'Invalid version format. Expected format: major.minor.patch',
      );
    }
    return AppVersion._(parts[0], parts[1], parts[2]);
  }

  @override
  bool operator ==(Object other) =>
      other is AppVersion &&
      major == other.major &&
      minor == other.minor &&
      patch == other.patch;

  @override
  int get hashCode => Object.hash(major, minor, patch);

  @override
  int compareTo(AppVersion other) {
    if (major != other.major) return major.compareTo(other.major);
    if (minor != other.minor) return minor.compareTo(other.minor);
    return patch.compareTo(other.patch);
  }

  bool operator <(AppVersion other) => compareTo(other) < 0;
  bool operator <=(AppVersion other) => compareTo(other) <= 0;
  bool operator >(AppVersion other) => compareTo(other) > 0;
  bool operator >=(AppVersion other) => compareTo(other) >= 0;

  @override
  String toString() => '$major.$minor.$patch';
}
