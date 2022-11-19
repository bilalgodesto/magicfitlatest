class LoginController {
  Future<bool> login(String email, String password) async {
    if (email == 'bilal@magic.fit' && password == '123456') {
      return true;
    } else {
      return false;
    }
  }
}
