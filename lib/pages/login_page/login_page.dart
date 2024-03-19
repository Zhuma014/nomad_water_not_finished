import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'dart:convert';

import '../../providers/cookies_provider.dart';
import '../admin_pages/home_page_admin.dart';
import '../main_page/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    final cookiesProvider =
        Provider.of<CookiesProvider>(context, listen: false);

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('http://192.168.56.1:8080/api/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'password': _passwordController.text.trim(),
      'phone': _phoneController.text.trim(),
    });

    final response = await http.post(url, headers: headers, body: body);

    // Extract cookies from response headers
    final cookies = response.headers['set-cookie'] ?? '';
    print('Cookies received: $cookies');

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 204 || response.statusCode == 200) {
      // If cookies are not empty, save them for later use
      if (cookies.isNotEmpty) {
        cookiesProvider.setCookies(cookies);

        print('Login successful, cookies saved: $cookies');
      }
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Provider.of<CookiesProvider>(context).isAdmin
                ? HomePageAdmin()
                : HomePage()),
      );
    } else {
      // Login failed, show error message
      print('Login failed');
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Demo'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(labelText: 'Phone'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _login,
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
