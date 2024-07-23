// ignore_for_file: prefer_typing_uninitialized_variables

class AppExceptions implements Exception {
  final _msg;
  final _prefix;
  AppExceptions(
    this._msg,
    this._prefix,
  );
  @override
  String toString() {
    return "$_prefix $_msg";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? massage])
      : super(massage, "Error doing communication");
}

class BadDataException extends AppExceptions {
  BadDataException([String? massage])
      : super(massage, "Bad or Invalid request");
}

class UnAuthDataException extends AppExceptions {
  UnAuthDataException([String? massage])
      : super(massage, "UnAuthorized request");
}

class DataNotFoundException extends AppExceptions {
  DataNotFoundException([String? massage]) : super(massage, "404 Not found");
}

class ServerException extends AppExceptions {
  ServerException([String? massage])
      : super(massage, "Internal Server Error 500");
}

class InvalidDataException extends AppExceptions {
  InvalidDataException([String? massage]) : super(massage, "Invalid inputs");
}
