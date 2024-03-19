// ignore_for_file: prefer_const_constructors
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nomad_water_v2/pages/status_page/status_app_bar.dart';
import '../../others/bottom_nav_bar.dart';
import 'alert_dialog_cancel.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
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
      // Add more cases for other bottom navigation bar items
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 241, 242),
      body: ListView(children: [
        StatusAppBar(),
        Padding(
            padding: const EdgeInsets.fromLTRB(25, 24, 25, 0),
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 24, right: 16),
                            child: Icon(
                              Icons.check,
                              color: Color.fromARGB(255, 78, 194, 111),
                              size: 20,
                            )),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            "Оформление заказа",
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 54, 70),
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 24, right: 16),
                            child: Icon(
                              Icons.check,
                              color: Color.fromARGB(255, 78, 194, 111),
                              size: 20,
                            )),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            "Подтверждение на складе",
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 54, 70),
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 29, right: 21),
                            child: Icon(
                              Icons.circle,
                              color: Color.fromARGB(255, 11, 163, 209),
                              size: 10,
                            )),
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            "Доставляется по адресу",
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 54, 70),
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                top: 20, left: 29, right: 21, bottom: 20),
                            child: Icon(
                              Icons.circle,
                              color: Color.fromARGB(76, 152, 162, 165),
                              size: 10,
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            "Завершено",
                            style: TextStyle(
                              color: Color.fromARGB(255, 152, 162, 165),
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ожидаемая доставка:",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 54, 70),
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "завтра до 16:00",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 54, 70),
                            fontFamily: "Montserrat",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "Мангилик Ел С 4.6, блок А",
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 54, 70),
                              fontFamily: "Montserrat",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 28),
                          child: Text("Айнагуль, +7 777 707 7070",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 54, 70),
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 240, 241, 242),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/bottle_in_item_page.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Nomad Water негаз., 5 л",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 54, 70),
                                fontFamily: "Montserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                            Text(
                              "Количество: 10",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 54, 70),
                                fontFamily: "Montserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                            Text(
                              "Цена: 5 000 T",
                              style: TextStyle(
                                color: Color.fromARGB(255, 2, 54, 70),
                                fontFamily: "Montserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Способ оплаты',
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 2, 54, 70)),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 8, right: 24),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "VISA",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 2, 54, 70)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 8),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "•••• 4444",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 2, 54, 70)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        "Оплачено",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(
                              255,
                              78,
                              194,
                              111,
                            )),
                      )
                    ],
                  )),
              Container(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 16, bottom: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Color.fromARGB(255, 2, 54, 70),
                      size: 18,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Доставка до адреса',
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 54, 70),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      "     +300 T",
                      style: TextStyle(
                          color: Color.fromARGB(
                            255,
                            152,
                            162,
                            165,
                          ),
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: DottedLine(
                  dashLength: 10,
                  dashGapLength: 8,
                  lineThickness: 1,
                  dashColor: Color.fromARGB(255, 152, 162, 165),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 16, bottom: 25),
                child: Row(
                  children: const [
                    Text(
                      "Итого:",
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 54, 70),
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      " 5 300 T",
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 54, 70),
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              DialogExample(),
            ]))
      ]),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavigationTapped,
      ),
    );
  }
}
