class Utilities {
  int generateKey() {
    return DateTime.now().microsecondsSinceEpoch.remainder(400000);
  }
}
