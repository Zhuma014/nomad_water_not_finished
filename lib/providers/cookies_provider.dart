import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CookiesProvider with ChangeNotifier {
  String _cookies = '';
  String get cookies => _cookies;

  bool get isLoggedIn => _cookies.isNotEmpty;

  bool get isAdmin {
    // Extract the token from the cookies
    final token = _cookies.split(';')[0].split('=')[1];

    // Decode the token
    final decodedToken = JwtDecoder.decode(token);

    // Check if the user is an admin
    final role = decodedToken['role'];
    return role == 'ROLE_ADMIN';
  }

  void setCookies(String cookies) {
    _cookies = cookies;

    notifyListeners();
  }

  void clearCookies() {
    _cookies = '';
    notifyListeners();
  }
}
