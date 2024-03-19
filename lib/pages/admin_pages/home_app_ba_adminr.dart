// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nomad_water_v2/providers/location_provider.dart';
import '../login_page/login_page.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    return AppBar(
      centerTitle: true,
      title: Text(
        "Пользователи",
        style: TextStyle(
          color: Color.fromARGB(
            255,
            2,
            54,
            70,
          ),
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      toolbarHeight: 46,
      shadowColor: Color.fromARGB(255, 240, 241, 242),
      actions: [
        IconButton(
          onPressed: (() {}),
          icon: Icon(Icons.favorite_border_outlined),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () => locationProvider.updateCurrentPosition(),
          icon: Icon(Icons.location_on_outlined),
          color: Colors.black,
        ),
        if (locationProvider.isLoading)
          CircularProgressIndicator(), // Show the circular progress indicator
      ],
    );
  }
}
