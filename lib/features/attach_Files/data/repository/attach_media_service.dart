import 'package:dartz/dartz.dart';
import 'package:suraksha_saathi/constants/api_constants.dart';
import 'package:suraksha_saathi/utils/api_handler.dart';

class AttachMedaiService {
  Future<Either<bool, String>> addData({
    required String photoUrl,
    required String audioUrl,
    required String videoUrl,
    required String description,
  }) async {
    print("hello world");
    try {
      final data = {
        "photoUrl": photoUrl,
        "audioUrl": audioUrl,
        "videoUrl": videoUrl,
        "description": description
      };
      await apiHandler.callApi(ApiMethod.post, data, ApiConstants.addAttachUrl,
          isHeader: true);
      return left(true);
    } catch (e) {
      print(e);
      return right(e.toString());
    }
  }
}
