class BaseError extends Error {
  final String message;

  BaseError({required this.message});

  @override
  String toString() {
    return message;
  }
}

class AppError extends BaseError {
  AppError({required super.message});
}

class APIError extends BaseError {
  APIError({required super.message});
}

class ConnectionError extends BaseError {
  ConnectionError({required super.message});
}
