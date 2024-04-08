import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:suraksha_saathi/constants/api_constants.dart';
import 'package:suraksha_saathi/utils/api_handler.dart';
import 'package:suraksha_saathi/utils/exceptions.dart';

class AuthRepository {
  Future<Either<String, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = {"email": email, "password": password};
      final response =
          await apiHandler.callApi(ApiMethod.post, data, ApiConstants.login);
      final accessToken = response.data['accessToken'];
      return left(accessToken);
    } on DioException catch (e) {
      final dioExceptionHandler = DioExceptionHandler.fromDioError(e).message;
      return right(dioExceptionHandler);
    }
  }

  Future<Either<bool, String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String number,
    required String password,
    required String imageUrl,
    required String passportImageUrl,
  }) async {
    try {
      final data = {
        "firstName": firstName,
        "lastName": lastName,
        "imageUrl": imageUrl,
        "passportImageUrl": passportImageUrl,
        "email": email,
        "password": password,
        "number": number,
      };

      await apiHandler.callApi(ApiMethod.post, data, ApiConstants.signUp);
      return left(true);
    } on DioException catch (e) {
      final dioExceptionHandler = DioExceptionHandler.fromDioError(e).message;
      return right(dioExceptionHandler);
    }
  }
}
