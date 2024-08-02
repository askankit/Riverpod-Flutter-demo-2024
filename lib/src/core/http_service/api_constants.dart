
abstract final class ResponseStatus {
  static const int error = 500;
  static const int success = 200;
  static const int authentication = 401;
  static const int someWentWrong = 400;
  static const int notFoundException = 404;
}

abstract final class ApiConstants {

  // static const String baseUrl = "https://hoopspot.app/api/v1";
  static const String url = "https://manish.parastechnologies.in/AutoExpertsTx";
  static const String baseUrl = "$url/api/v1";
  static const String imageUrl = "https://hoopspot.app/public/uploads/users/";

  ///Auth Module
  static const String signUp = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String socialLogin = "$baseUrl/social/login";
  static const String editProfile = "$baseUrl/edit/profile";
  static const String getPreferences = "$baseUrl/get/preferences";
  static const String userPreference = "$baseUrl/user/preference";
  static const String forgetPassword = "$baseUrl/forget/password";
  static const String verifyOtp = "$baseUrl/verify/otp";
  static const String resetPassword = "$baseUrl/reset/password";
  static const String contact = "$baseUrl/contact";
  static const String getCmsPage = "$baseUrl/get/cms/page";
  static const String logout = "$baseUrl/logout";
  static const String changePassword = "$baseUrl/change/password";
  static const String toggleNotifications = "$baseUrl/toggle/notifications";
  static const String courseDetails = "$baseUrl/course/details";
  static const String home = "$baseUrl/home";
  static const String quizDetails = "$baseUrl/quiz/details";
  static const String courseSearch = "$baseUrl/course/search";
  static const String userQuiz= "$baseUrl/user/quiz";
  static const String quizResult= "$baseUrl/user/quiz/result";
  static const String courseProgress= "$baseUrl/user/course/progress";
  static const String resources= "$baseUrl/resources";
  static const String updatePreferences= "$baseUrl/update/preferences";
  static const String deleteAccount= "$baseUrl/delete/account";
  static const String getNotifications= "$baseUrl/get/notifications";
  static const String quizRating= "$baseUrl/user/quiz/rating";
  static const String vimeoVideo = "https://api.vimeo.com/videos/";

}