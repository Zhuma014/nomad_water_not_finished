// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:nomad_water_v2/pages/ordering_page/payment_type.dart';

typedef AddressContactsCallback = void Function(
    String street, String entrance, String apartment);

class AddressContacts extends StatefulWidget {
  final void Function(String street, String entrance, String apartment)
      onAddressContactsChanged;

  const AddressContacts({Key? key, required this.onAddressContactsChanged})
      : super(key: key);

  @override
  State<AddressContacts> createState() => _AddressContactsState();
}

class _AddressContactsState extends State<AddressContacts> {
  bool isExpanded = false;
  TextEditingController streetController = TextEditingController();
  TextEditingController entranceController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Attach text change listeners to the text editing controllers
    streetController.addListener(_onTextChanged);
    entranceController.addListener(_onTextChanged);
    apartmentController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    String street = streetController.text;
    String entrance = entranceController.text;
    String apartment = apartmentController.text;

    // Call the callback function provided by the parent widget
    widget.onAddressContactsChanged(street, entrance, apartment);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25, top: 16, bottom: 19),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Адрес и контакты',
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 2, 54, 70)),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      child: Icon(isExpanded
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_right_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isExpanded)
          AnimatedContainer(
            duration: Duration(seconds: 3),
            height: 421,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        margin: EdgeInsets.only(top: 16),
                        alignment: Alignment.centerLeft,
                        duration: const Duration(seconds: 2),
                        child: Text(
                          "Улица",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 2, 54, 70)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: streetController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Улица",
                              hintStyle: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 2, 54, 70))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Подъезд",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 2, 54, 70)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: entranceController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Подъезд",
                              hintStyle: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 2, 54, 70))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Квартира",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 2, 54, 70)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.only(left: 16, top: 6, bottom: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: apartmentController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Квартира",
                              hintStyle: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 2, 54, 70))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Получатель",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 2, 54, 70)),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Имя: ",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 2, 54, 70)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Айнагуль",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 2, 54, 70)),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Телефон: ",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 2, 54, 70)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "+7 777 777 7777",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 2, 54, 70)),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Wrap(
                                    children: <Widget>[
                                      Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 22, bottom: 22),
                                                child: Container(
                                                  width: 60,
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 152, 162, 165),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                      "Изменение данных профиля",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromARGB(
                                                              255, 2, 54, 70))),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5.5,
                                                        left: 25,
                                                        bottom: 4),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "Имя",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromARGB(
                                                              255, 2, 54, 70)),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 25,
                                                        bottom: 20,
                                                        right: 25),
                                                    padding: EdgeInsets.only(
                                                        left: 16),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              152,
                                                              162,
                                                              165),
                                                          width: 1),
                                                      color: Colors.white,
                                                    ),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText: "Имя",
                                                          hintStyle: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      152,
                                                                      162,
                                                                      165))),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5.5,
                                                        left: 25,
                                                        bottom: 4),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "Номер телефона",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Color.fromARGB(
                                                              255, 2, 54, 70)),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 25,
                                                        bottom: 4,
                                                        right: 25),
                                                    padding: EdgeInsets.only(
                                                        left: 16),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              152,
                                                              162,
                                                              165),
                                                          width: 1),
                                                      color: Colors.white,
                                                    ),
                                                    child: TextField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration: InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              "+7 (7 _ _) _ _ _  _ _ _ _",
                                                          hintStyle: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      152,
                                                                      162,
                                                                      165))),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 50,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    margin: EdgeInsets.only(
                                                        left: 25, right: 25),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromARGB(
                                                                255,
                                                                2,
                                                                54,
                                                                70), // Background color
                                                        foregroundColor: Colors
                                                            .white, // Text Color (Foreground color)
                                                      ),
                                                      child: const Text(
                                                          'Сохранить изменения'),
                                                      onPressed: () =>
                                                          // Unfocus both text fields when the close button is pressed

                                                          Navigator.pop(
                                                              context),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 8),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Изменить",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 11, 163, 209)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        PaymentType(),
      ],
    );
  }
}
