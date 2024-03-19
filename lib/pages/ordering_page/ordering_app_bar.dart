// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'ordering_page.dart';

class OrderingAppBar extends StatelessWidget {
  const OrderingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 152, 162, 165),
              size: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35),
            child: Row(
              children: [
                Text(
                  "Оформление заказа",
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 54, 70),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
