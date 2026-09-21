class Settings {
  static final Settings _instance = Settings._internal();

  Settings._internal();

  factory Settings() {
    return _instance;
  }
}

void main() {
  Settings a = Settings();
  Settings b = Settings();
  Settings c = Settings._internal();
  print(identical(a, b));
  print(identical(a, c));

}

