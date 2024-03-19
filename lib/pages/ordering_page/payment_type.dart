// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nomad_water_v2/pages/ordering_page/modal_bottom_sheet_type_of_payment.dart';

class PaymentType extends StatefulWidget {
  const PaymentType({Key? key}) : super(key: key);

  @override
  State<PaymentType> createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.only(
          left: 25,
          top: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Способ оплаты',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 2, 54, 70)),
              ),
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Wrap(children: const <Widget>[CardPayment()]);
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
                  "Выберите способ оплаты",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 11, 163, 209)),
                ),
              ),
            )
          ],
        ));
  }
}
