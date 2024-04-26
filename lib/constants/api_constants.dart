class ApiConstants {
  static const String localIP = "192.168.1.66";
  static const String baseUrl = "http://$localIP:3000/";
  static const String signUp = "${baseUrl}user/signUp";
  static const String login = "${baseUrl}user/login";
  static const String getUser = "${baseUrl}user/getUserProfile";
  static const String getUnveriedUserUrl = "$baseUrl/user/getUnverifiedUsers";
  static const String uploadImage = "${baseUrl}image/uploadImage";
  static const String uploadAudio = "${baseUrl}image/uploadAudio";
  static const String uploadVideo = "${baseUrl}image/uploadVideo";
  static const String addAttachUrl = "${baseUrl}attach_files/addAttachFile";
}
