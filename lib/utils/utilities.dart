class Utils {
  static String getUserName(String email) {
    return '${email.split('@')[0]}';
  }
}
