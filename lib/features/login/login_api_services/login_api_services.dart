abstract class LoginApiServices {
  Future<void> login();
  Future<void> regester();
  Future<void> logout();
  Future<bool> isSessionValid();
}
