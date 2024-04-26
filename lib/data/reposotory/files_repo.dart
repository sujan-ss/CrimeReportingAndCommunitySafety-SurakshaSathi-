import 'package:dio/dio.dart';
import 'package:suraksha_saathi/constants/api_constants.dart';

enum FileTypo {
  image,
  video,
  audio,
}

class FileRepo {
  static Future<String> uploadImage(String filePath, FileTypo type) async {
    String url;
    String key;

    //checks te file type and sets the url accordingly
    if (type == FileTypo.image) {
      url = ApiConstants.uploadImage;
      key = "image";
    } else if (type == FileTypo.video) {
      url = ApiConstants.uploadVideo;
      key = "audio";
    } else {
      url = ApiConstants.uploadAudio;
      key = "video";
    }

    try {
      String fileName = filePath; // Get the file name from the image path
      FormData formData = FormData.fromMap({
        key: await MultipartFile.fromFile(filePath, filename: fileName),
      });

      Response response = await Dio().post(
        url,
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );
      return response.data["imageUrl"];
    } catch (e) {
      rethrow;
    }
  }
}
