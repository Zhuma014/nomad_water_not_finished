// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nomad_water_v2/pages/ordering_page/ordering_page.dart';
import 'package:nomad_water_v2/pages/item_page/count_buttons.dart';
import 'package:nomad_water_v2/pages/main_page/water_items_widget.dart';
import 'package:provider/provider.dart';
import '../../providers/location_provider.dart';
import 'item_app_bar.dart';
import '../../others/red_favorite.dart';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

import 'dart:convert';

import '../main_page/home_page.dart';

class ItemPage extends StatefulWidget {
  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 241, 242),
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 31, right: 25, bottom: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "lib/assets/images/bottle_in_item_page.jpg",
                height: 247,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nomad Water, 5л, негаз.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Color.fromARGB(255, 2, 54, 70),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Описание продукта",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: Color.fromARGB(255, 152, 162, 165),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 4),
                      alignment: Alignment.centerLeft,
                      width: 72,
                      child: Text(
                        "Доставка:",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Color.fromARGB(255, 2, 54, 70),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 4, left: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Сегодня до 16:00",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Color.fromARGB(255, 152, 162, 165),
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 4),
                      alignment: Alignment.centerLeft,
                      width: 72,
                      child: Text(
                        "Объём:",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Color.fromARGB(255, 2, 54, 70),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 4, left: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "500 л",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Color.fromARGB(255, 152, 162, 165),
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: 4),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "В наличии",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: Color.fromARGB(255, 78, 194, 111),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "5 000 T",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            color: Color.fromARGB(255, 2, 54, 70),
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          CountButton(),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            height: 32,
            thickness: 1,
            color: Color.fromARGB(39, 152, 162, 165),
          ),
          Padding(
              padding: EdgeInsets.only(left: 27, top: 4, right: 27, bottom: 10),
              child: Text(
                "Рекомендации",
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 54, 70),
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: WaterItemslist(),
          )
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.only(left: 26, top: 20, bottom: 20),
        child: Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 2, 54, 70),
              ),
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Consumer<LocationProvider>(
                            builder: (context, locationProvider, _) =>
                                OrderingPage(
                              currentPosition: locationProvider.currentPosition,
                              updateCurrentPosition:
                                  locationProvider.updateCurrentPosition,
                            ),
                          )),
                );
              }),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(79, 13, 79, 13),
                child: Text(
                  "Заказать",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 26),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(
                        38,
                        240,
                        186,
                        186,
                      ),
                      border: Border.all(
                        color: Color.fromARGB(
                          38,
                          240,
                          186,
                          186,
                        ),
                      )),
                  child:
                      SizedBox(height: 45, width: 35, child: FavoriteButton()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
