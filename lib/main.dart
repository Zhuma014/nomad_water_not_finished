// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nomad_water_v2/pages/admin_pages/home_page_admin.dart';
import 'package:nomad_water_v2/pages/login_page/login_page.dart';
import 'package:nomad_water_v2/pages/login_page/logout.dart';
import 'package:nomad_water_v2/pages/main_page/home_page.dart';
import 'package:nomad_water_v2/pages/my_orders_page/my_orders_page.dart';
import 'package:nomad_water_v2/providers/cookies_provider.dart';
import 'package:nomad_water_v2/providers/location_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => CookiesProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.updateCurrentPosition();
    final cookiesProvider =
        Provider.of<CookiesProvider>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => HomePage(),
        '/myorders': (context) => MyOrders(),
        '/login': (context) => Provider.of<CookiesProvider>(context).isLoggedIn
            ? LogoutPage()
            : LoginPage(),
      },
    );
  }
}
