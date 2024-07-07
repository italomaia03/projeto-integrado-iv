class DuplicatedUserException implements Exception {
  String message;
  DuplicatedUserException(this.message);

  @override
  String toString() {
    return message;
  }
}