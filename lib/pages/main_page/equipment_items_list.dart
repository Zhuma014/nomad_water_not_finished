// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:nomad_water_v2/pages/item_page/item_page.dart';
import 'package:nomad_water_v2/others/red_favorite.dart';

class EquipmentItemslist extends StatelessWidget {
  const EquipmentItemslist({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.70,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 7; i++)
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ItemPage()));
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/bottle.jpg',
                        height: 145,
                        width: 145,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, left: 1),
                        alignment: Alignment.centerLeft,
                        width: 160,
                        child: Text(
                          "Nomad, 5л, негаз.",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Color.fromARGB(255, 2, 54, 70),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 2, left: 1),
                          alignment: Alignment.centerLeft,
                          width: 160,
                          child: Text(
                            "Доп. описание",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10,
                              color: Color.fromARGB(255, 152, 162, 165),
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 2, left: 1),
                          alignment: Alignment.centerLeft,
                          width: 160,
                          child: Text(
                            "В наличии",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10,
                              color: Color.fromARGB(255, 78, 194, 111),
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(top: 8, left: 1),
                          alignment: Alignment.centerLeft,
                          width: 160,
                          child: Text(
                            "5 000 T",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: Color.fromARGB(255, 2, 54, 70),
                              fontWeight: FontWeight.w700,
                            ),
                          ))
                    ],
                  ),
                ),
                Positioned(
                  top: -4,
                  right: -4,
                  child: FavoriteButton(),
                ),
              ],
            ),
          ),
        // Second container with similar content
        // ...
      ],
    );
  }
}
