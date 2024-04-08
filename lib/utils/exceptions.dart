import 'package:dio/dio.dart';

class DioExceptionHandler implements Exception {
  DioExceptionHandler.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.badCertificate:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
            dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return showError(error, "Something went wrong");
      case 401:
        return showError(error, "Invalid Credentials");
      case 404:
        return 'Error 404';
      case 409:
        return showError(error, 'User with this email already exists');
      case 500:
        return showError(error, 'Internal server error');
      default:
        return showError(error, 'Oops something went wrong');
    }
  }

  String showError(dynamic error, String err) {
    try {
      return error["error"];
    } catch (e) {
      return err;
    }
  }

  @override
  String toString() => message;
}
