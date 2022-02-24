class Utilities {
  static int generateKey() {
    return DateTime.now().microsecondsSinceEpoch.remainder(40000);
  }
}
