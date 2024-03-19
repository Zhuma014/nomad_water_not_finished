// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nomad_water_v2/others/red_favorite.dart';
import 'package:nomad_water_v2/providers/location_provider.dart';
import 'package:nomad_water_v2/pages/ordering_page/address_contacts.dart';
import 'package:nomad_water_v2/pages/ordering_page/ordering_app_bar.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';

import '../../providers/cookies_provider.dart';
import '../main_page/home_page.dart';

class OrderingPage extends StatefulWidget {
  const OrderingPage({
    Key? key,
    required this.currentPosition,
    required this.updateCurrentPosition,
  }) : super(key: key);

  final Position? currentPosition;
  final Function() updateCurrentPosition;

  @override
  State<OrderingPage> createState() => _OrderingPageState();
}

class _OrderingPageState extends State<OrderingPage> {
  String street = '';
  String entrance = '';
  String apartment = '';

  void _onAddressContactsChanged(
      String street, String entrance, String apartment) {
    setState(() {
      this.street = street;
      this.entrance = entrance;
      this.apartment = apartment;
    });
  }

  bool pickUp = false;
  bool delivery = false;

  Position? _currentPosition;
  bool _hasCurrentPosition = false;

  @override
  void initState() {
    super.initState();
    _currentPosition = widget.currentPosition;
    _hasCurrentPosition = _currentPosition != null;
  }

  void _sendLocationData(String cookies) async {
    try {
      final order = {
        "address": "$street $entrance $apartment",
        "comment": "string",
        "courierGeoDtoList": [
          {"dist": 0, "latitude": 0, "longitude": 0, "userId": 0}
        ],
        "courierId": 0,
        "deliveryDateTime": "string",
        "firstname": "string",
        "id": 4,
        "latitude": _currentPosition?.latitude,
        "longitude": _currentPosition?.longitude,
        "orderProductsDto": [
          {"id": 3, "orderId": 3, "productId": 1, "quantity": 1}
        ],
        "paymentMethod": "Наличными",
        "paymentUrl": "string",
        "phone": "+77078872567",
        "sale": true,
        "statusId": 0,
        "totalPrice": 0,
        "userId": 3,
        "withDeposit": false
      };

// Connect to WebSocket using cookies
      final cookies =
          Provider.of<CookiesProvider>(context, listen: false).cookies;
      if (cookies.isEmpty) {
        print("Please, firstly login");
      } else {
        final channel = IOWebSocketChannel.connect(
          Uri.parse('ws://192.168.56.1:8080/order/create'),
          headers: {'Cookie': '$cookies'},
        );
        if (!_hasCurrentPosition) {
          print('Current position is not available');
          return;
        }
        channel.sink.add(jsonEncode(order));

        // Listen to WebSocket for response
        channel.stream.listen((order) {
          print('Received: $order');
          // Add your code to handle the response from the server
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on HandshakeException catch (e) {
      print('Handshake error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 241, 242),
      body: ListView(children: [
        OrderingAppBar(),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 24, 25, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                child: Column(children: [
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
              AddressContacts(
                onAddressContactsChanged: _onAddressContactsChanged,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 16, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: pickUp,
                            activeColor: Color.fromARGB(255, 2, 54, 70),
                            tristate: true,
                            shape: CircleBorder(),
                            onChanged: (typeOrder) {
                              setState(() {
                                if (typeOrder != null) {
                                  pickUp = typeOrder;
                                  delivery = !typeOrder;
                                }
                              });
                            }),
                        Text(
                          'Доставка до адреса',
                          style: TextStyle(
                            color: pickUp
                                ? Color.fromARGB(255, 2, 54, 70)
                                : Color.fromARGB(
                                    255,
                                    152,
                                    162,
                                    165,
                                  ), // Update text color
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat", fontSize: 14,
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
                    Row(
                      children: [
                        Checkbox(
                            value: delivery,
                            activeColor: Color.fromARGB(255, 2, 54, 70),
                            tristate: true,
                            shape: CircleBorder(),
                            onChanged: (typeOrder) {
                              setState(() {
                                if (typeOrder != null) {
                                  delivery = typeOrder;
                                  pickUp = !typeOrder;
                                }
                              });
                            }),
                        Text(
                          'Cамовызов',
                          style: TextStyle(
                            color: delivery
                                ? Color.fromARGB(255, 2, 54, 70)
                                : Color.fromARGB(
                                    255, 152, 162, 165), // Update text color
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat", fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: DottedLine(
                  dashLength: 12,
                  dashGapLength: 12,
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
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 26, top: 20, bottom: 20, right: 26),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 2, 54, 70),
                ),
                onPressed: () {
                  final cookiesProvider =
                      Provider.of<CookiesProvider>(context, listen: false);
                  final cookies = cookiesProvider.cookies;
                  _sendLocationData(cookies);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(79, 13, 79, 13),
                  child: Text(
                    "Оформить заказ",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
