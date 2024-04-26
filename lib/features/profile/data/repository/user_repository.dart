import 'package:dartz/dartz.dart';
import 'package:suraksha_saathi/constants/api_constants.dart';
import 'package:suraksha_saathi/data/model/user_model.dart';
import 'package:suraksha_saathi/data/reposotory/access_tooken_reposotory.dart';
import 'package:suraksha_saathi/utils/api_handler.dart';

class UserRepo {
  Future<Either<User, String>> getUser() async {
    try {
      final response = await apiHandler
          .callApi(ApiMethod.get, null, ApiConstants.getUser, isHeader: true);
      User user = User.fromJson(response.data["user"]);
      return Left(user);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
