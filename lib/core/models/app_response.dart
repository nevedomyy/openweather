import 'dart:io' show SocketException;

import 'package:dio/dio.dart' show DioException;

class AppResponse {
  final dynamic object;
  final String errorMessage;

  const AppResponse({
    this.object,
    this.errorMessage = 'Ups! Something goes wrong...',
  });

  factory AppResponse.success(dynamic object) {
    return AppResponse(object: object);
  }

  factory AppResponse.withError(dynamic e, StackTrace s) {
    if (e is DioException && e.error is SocketException) {
      return const AppResponse(errorMessage: 'Check network connection');
    }
    return const AppResponse(errorMessage: 'Ups! Something goes wrong...');
  }
}
