// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyOrdersAppBar extends StatelessWidget {
  const MyOrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Мои заказы",
            style: TextStyle(
                color: Color.fromARGB(255, 2, 54, 70),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
