class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? message)
      : super(message, "Error during communication");
}

class BadRequestException extends AppException {
  BadRequestException(String? message)
      : super(message, "Invalid request"); // url is wrong
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String? message)
      : super(message, "Unauthorized request"); // token is expired
}

class InvalidInputException extends AppException {
  InvalidInputException(String? message)
      : super(message, "Invalid Input"); // token is expired
}
