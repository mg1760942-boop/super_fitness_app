class ApiEndPoints {
  ApiEndPoints._();
  static const String forgetPassword = "auth/forgotPassword";
  static const String verifyReset = "auth/verifyResetCode";
  static const String resetPassword = "auth/resetPassword";
  static const String login = "auth/signin";
  static const String register = 'auth/signup';
  static const String getUserData = 'auth/profile-data';
  static const String mealCategories = 'categories.php';
  static const String mealsByCategory = 'filter.php';
  static const String mealDetail = 'lookup.php';
  static const String editProfile = "auth/editProfile";
  static const String uploadImage = "auth/upload-photo";
  static const String musclesRandom = "muscles/random";
}
