class ApiEndPoints {
  ApiEndPoints._();
  static const String forgetPassword = "auth/forgotPassword";
  static const String verifyReset = "auth/verifyResetCode";
  static const String resetPassword = "auth/resetPassword";
  static const String login = "auth/signin";
  static const String register = 'auth/signup';
  static const String getUserData = 'auth/profile-data';
  static const String mealCategories = '1/categories.php';
  static const String mealsByCategory = '1/filter.php';
  static const String mealDetail = '1/lookup.php';
}
