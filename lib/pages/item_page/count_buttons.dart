// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class CountButton extends StatefulWidget {
  const CountButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CountButtonState createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  int _count = 1;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: _decrementCount,
          child: Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              Icons.remove,
              color: Color.fromARGB(255, 2, 54, 70),
              size: 18,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Text(
            '  $_count',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Color.fromARGB(255, 2, 54, 70),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        GestureDetector(
          onTap: _incrementCount,
          child: Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              Icons.add,
              color: Color.fromARGB(255, 2, 54, 70),
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
