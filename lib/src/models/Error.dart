import 'dart:core';

class APIError extends Error {
  final int code;
  final String message;

  APIError({
    this.code,
    this.message
  }) {
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(message, 'message');
  }

  /// Function constructs an Error object from the JSON returned from API
  ///
  /// @param json The JSON value that we got from API result
  /// @returns Returns an Error object constructed from the API's returned JSON
  /// @throws Throws ArgumentError related to the missing parameter of Error constructor
  static APIError fromJSON (Map<String, dynamic> json) {
    return APIError(
      code: json['code'],
      message: json['message'],
    );
  }

}