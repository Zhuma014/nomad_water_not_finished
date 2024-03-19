// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardPayment extends StatefulWidget {
  const CardPayment({Key? key}) : super(key: key);

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  bool? newTypePayment = false;
  bool isExpandedModal = false;
  bool isSavedCard = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isButtonActive = false; // Initially set to false
  late TextEditingController cardNumberController;
  late TextEditingController expirationController;
  late TextEditingController cvcController;
  late TextEditingController nameOnCardController;

  @override
  void initState() {
    super.initState();

    cardNumberController = TextEditingController();
    expirationController = TextEditingController();
    cvcController = TextEditingController();
    nameOnCardController = TextEditingController();

    // Add listeners to both text fields
    cardNumberController.addListener(updateButtonActive);
    expirationController.addListener(updateButtonActive);
    cvcController.addListener(updateButtonActive);
    nameOnCardController.addListener(updateButtonActive);
    nameOnCardController.addListener(_onNameOnCardChanged);
  }

  void _onNameOnCardChanged() {
    // Get the current text value
    String currentText = nameOnCardController.text;

    // Convert the text to uppercase
    String uppercaseText = currentText.toUpperCase();

    // Set the uppercase text back to the text field
    nameOnCardController.value = nameOnCardController.value.copyWith(
      text: uppercaseText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: uppercaseText.length),
      ),
    );
  }

  void updateButtonActive() {
    final cardNumberNotEmpty = cardNumberController.text.isNotEmpty;
    final expirationNotEmpty = expirationController.text.isNotEmpty;
    final cvcNotEmpty = cvcController.text.isNotEmpty;
    final nameOnCardNotEmpty = nameOnCardController.text.isNotEmpty;

    // Update isButtonActive based on both text fields' content
    setState(() {
      isButtonActive = cardNumberNotEmpty &&
          expirationNotEmpty &&
          cvcNotEmpty &&
          nameOnCardNotEmpty;
    });
  }

  @override
  void dispose() {
    nameOnCardController.removeListener(_onNameOnCardChanged);
    nameOnCardController.dispose();

    cardNumberController.dispose();
    expirationController.dispose();
    cvcController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 22, bottom: 22),
            child: Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 152, 162, 165),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpandedModal = !isExpandedModal;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 30),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 14,
                              width: 14,
                              child: Checkbox(
                                  value: isSelected1,
                                  activeColor: Colors.blue,
                                  tristate: true,
                                  shape: CircleBorder(),
                                  onChanged: (newTypePayment) {
                                    setState(() {
                                      if (newTypePayment != null) {
                                        isSelected1 = newTypePayment;
                                        isSelected2 = !newTypePayment;
                                        isSavedCard = !newTypePayment;
                                        isButtonActive = false;
                                      }
                                    });
                                  }),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 128),
                              child: Text("Оплатить картой",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(255, 2, 54, 70))),
                            ),
                            Icon(isExpandedModal
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_right_outlined),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (isExpandedModal)
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    child: Column(children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 4),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Номер банковской карты",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 2, 54, 70)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Color.fromARGB(255, 152, 162, 165),
                                  width: 1),
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: cardNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(16),
                                CardNumberInputFormatter(),
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "4400  0000  0000  0000",
                                  hintStyle: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Color.fromARGB(255, 152, 162, 165))),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 20, right: 10),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      "Срок действия",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromARGB(255, 2, 54, 70)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 152, 162, 165),
                                          width: 1),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      controller: expirationController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(4),
                                        CardMonthInputFormatter(),
                                      ],
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "01/01",
                                          hintStyle: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 152, 162, 165))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      "СVV",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromARGB(255, 2, 54, 70)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 152, 162, 165),
                                          width: 1),
                                      color: Colors.white,
                                    ),
                                    child: TextField(
                                      controller: cvcController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "***",
                                          hintStyle: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 152, 162, 165))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 4),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Имя и фамилия на карте",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 2, 54, 70)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: Color.fromARGB(255, 152, 162, 165),
                                  width: 1),
                              color: Colors.white,
                            ),
                            child: TextField(
                              controller: nameOnCardController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "JOHN SMITH",
                                  hintStyle: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Color.fromARGB(255, 152, 162, 165))),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isSavedCard,
                              activeColor: Colors.black,
                              tristate: true,
                              onChanged: (saveCard) {
                                setState(() {
                                  if (isButtonActive) {
                                    // Perform action when button is pressed
                                    isSavedCard = !isSavedCard;
                                  }
                                });
                              },
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 128),
                              child: Text("Сохранить карту",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 2, 54, 70))),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 14,
                              width: 14,
                              child: Checkbox(
                                  value: isSelected2,
                                  activeColor: Colors.blue,
                                  tristate: true,
                                  shape: CircleBorder(),
                                  onChanged: (newTypePayment) {
                                    setState(() {
                                      if (newTypePayment != null) {
                                        isSelected2 = newTypePayment;
                                        isSelected1 = !newTypePayment;
                                        isSavedCard = !newTypePayment;
                                        isButtonActive = newTypePayment;
                                      }
                                    });
                                  })),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 128),
                            child: Text("Наличными",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 2, 54, 70))),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 40),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // Background color
                            backgroundColor: isButtonActive
                                ? Color.fromARGB(255, 2, 54, 70)
                                : Colors
                                    .grey, // Set the button color based on isButtonActive value

                            disabledForegroundColor:
                                Color.fromARGB(255, 2, 54, 70),
                            // Text Color (Foreground color)
                          ),
                          onPressed: isButtonActive
                              ? () {
                                  // Perform action when button is pressed
                                  setState(() {
                                    isButtonActive = false;
                                  });

                                  Navigator.pop(context);
                                }
                              : null,
                          child: const Text('Продолжить'),
                          // Unfocus both text fields when the close button is pressed
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
