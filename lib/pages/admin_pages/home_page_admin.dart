// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:nomad_water_v2/pages/admin_pages/home_app_ba_adminr.dart';
import 'package:nomad_water_v2/pages/admin_pages/users_list.dart';

import 'package:provider/provider.dart';
import '../../others/bottom_nav_bar.dart';
import '../../providers/location_provider.dart';
import '../main_page/water_items_widget.dart';
import 'categories_widget_admin.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({Key? key}) : super(key: key);

  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  int _currentIndex = 0;

  void _onBottomNavigationTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Handle navigation based on the index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/myorders');
        break;
      case 2:
        Navigator.pushNamed(context, '/login');
        break;
      // Add more cases for other bottom navigation bar items
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Container(
        color: Color.fromARGB(255, 240, 241, 242),
        padding: const EdgeInsets.fromLTRB(25, 39, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 340,
              height: 90,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  errorBorder: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 241, 242),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Поиск',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 2, 54, 70),
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            CategoriesWidget(),
            Consumer<LocationProvider>(
              builder: (context, locationProvider, _) {
                return locationProvider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Container(); // Placeholder for non-loading state
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavigationTapped,
      ),
    );
  }
}
