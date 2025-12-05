import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _loggedIn = false;
  String? _user;

  bool get isLoggedIn => _loggedIn;
  String? get user => _user;

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _loggedIn = email.isNotEmpty && password.length >= 4;
    _user = _loggedIn ? email : null;
    notifyListeners();
    return _loggedIn;
  }

  void logout() {
    _loggedIn = false;
    _user = null;
    notifyListeners();
  }
}
