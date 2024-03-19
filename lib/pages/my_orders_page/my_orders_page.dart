// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:nomad_water_v2/pages/my_orders_page/my_orders_app_bar.dart';
import 'package:nomad_water_v2/pages/ordering_page/ordering_page.dart';
import 'package:nomad_water_v2/pages/status_page/status_page.dart';

import '../../others/bottom_nav_bar.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int _currentIndex = 1;

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
      backgroundColor: Color.fromARGB(255, 240, 241, 242),
      body: ListView(children: [
        MyOrdersAppBar(),
        Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 23, bottom: 14),
                child: Text(
                  "Активные",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 2, 54, 70)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StatusPage()));
                },
                child: Container(
                  height: 104,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 12, top: 17, bottom: 17, right: 8),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage('lib/assets/images/bottle.jpg'),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Заказ: #123456",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 54, 70),
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "Nomad Water негаз., 5 л",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 152, 162, 165),
                                  fontFamily: "Montserrat",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "Адрес: адрес доставки",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 152, 162, 165),
                                  fontFamily: "Montserrat",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "5 000 T",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 2, 54, 70),
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "Ожидайте доставку сегодня",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 6, 167, 217),
                                  fontFamily: "Montserrat",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.only(right: 28, top: 35, bottom: 45),
                          child: SizedBox(
                            height: 6,
                            width: 14,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(76, 152, 162, 165),
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 14, top: 14),
                child: Text(
                  "Недавние",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 2, 54, 70)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StatusPage()));
                },
                child: Container(
                  height: 104,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 12, top: 17, bottom: 17, right: 8),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage('lib/assets/images/bottle.jpg'),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Заказ: #123456",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 54, 70),
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "Nomad Water негаз., 5 л",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 152, 162, 165),
                                  fontFamily: "Montserrat",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "Адрес: адрес доставки",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 152, 162, 165),
                                  fontFamily: "Montserrat",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "5 000 T",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 2, 54, 70),
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "Завершен",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 78, 194, 111),
                                  fontFamily: "Montserrat",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.only(right: 28, top: 35, bottom: 45),
                          child: SizedBox(
                            height: 6,
                            width: 14,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(76, 152, 162, 165),
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StatusPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 14, bottom: 14),
                  height: 104,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 12, top: 17, bottom: 17, right: 8),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage('lib/assets/images/bottle.jpg'),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Заказ: #123456",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 54, 70),
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "Nomad Water негаз., 5 л",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 152, 162, 165),
                                  fontFamily: "Montserrat",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "Адрес: адрес доставки",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 152, 162, 165),
                                  fontFamily: "Montserrat",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "5 000 T",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 2, 54, 70),
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2),
                              child: Text(
                                "Отменен по причине технических проблем",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 152, 162, 165),
                                  fontFamily: "Montserrat",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.only(right: 28, top: 35, bottom: 45),
                          child: SizedBox(
                            height: 6,
                            width: 14,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(76, 152, 162, 165),
                            ),
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        )
      ]),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavigationTapped,
      ),
    );
  }
}
