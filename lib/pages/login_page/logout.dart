import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nomad_water_v2/providers/cookies_provider.dart';
import 'package:nomad_water_v2/pages/login_page/login_page.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cookiesProvider =
        Provider.of<CookiesProvider>(context, listen: false);

    void _logout() {
      // Clear cookies
      cookiesProvider.clearCookies();

      // Navigate back to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _logout,
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
