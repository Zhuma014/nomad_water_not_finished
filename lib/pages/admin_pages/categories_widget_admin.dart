import 'package:flutter/material.dart';
import 'package:nomad_water_v2/pages/admin_pages/users_list.dart';
import 'package:nomad_water_v2/pages/main_page/water_items_widget.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 3),
              unselectedLabelColor: Color.fromARGB(255, 152, 162, 165),
              labelColor: Color.fromARGB(255, 2, 54, 70),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Tab(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Покупатели",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Tab(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Курьеры",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Tab(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Мастеры склада",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Tab(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Работники склада",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(children: [
                    Userslist()
                  ]), // Replace with your desired widget for "Вода"

                  ListView(
                    children: [
                      Userslist(), // Replace with your desired widget for "Оборудование"
                      SizedBox(height: 16), // Add spacing between lists
                    ],
                  ),
                  ListView(
                    children: [
                      Userslist(), // Replace with your desired widget for "Услуги"
                      SizedBox(height: 16), // Add spacing between lists
                    ],
                  ),
                  ListView(
                    children: [
                      Userslist(), // Replace with your desired widget for "Услуги"
                      SizedBox(height: 16), // Add spacing between lists
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
