import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:suraksha_saathi/constants/api_constants.dart';
import 'package:suraksha_saathi/utils/api_handler.dart';
import 'package:suraksha_saathi/utils/exceptions.dart';

class SucessResonse {
  final String accessToken;
  final bool verified;
  SucessResonse({required this.accessToken, required this.verified});
}

class AuthRepository {
  Future<Either<SucessResonse, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = {"email": email, "password": password};
      final response =
          await apiHandler.callApi(ApiMethod.post, data, ApiConstants.login);
      final accessToken = response.data['accessToken'];
      final verified = response.data['verified'];
      SucessResonse sucessResonse =
          SucessResonse(accessToken: accessToken, verified: verified);
      return left(sucessResonse);
    } on DioException catch (e) {
      final dioExceptionHandler = DioExceptionHandler.fromDioError(e).message;
      return right(dioExceptionHandler);
    } catch (e) {
      print("Something went wrong");

      return right("Something went wrong");
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
