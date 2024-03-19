import 'package:flutter/material.dart';

class DialogExample extends StatefulWidget {
  @override
  State<DialogExample> createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  bool undelivered = false;

  bool notMatchDescription = false;

  bool otherCauses = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Container(
          padding: EdgeInsets.only(bottom: 270, top: 200),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Container(
              padding: EdgeInsets.only(bottom: 16),
              child: const Text(
                'Выберите причину отмены заказа',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 54, 70),
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 14,
                            width: 14,
                            child: Checkbox(
                                value: undelivered,
                                activeColor: Color.fromARGB(255, 2, 54, 70),
                                tristate: true,
                                shape: CircleBorder(),
                                onChanged: (causeOfCancellation) {
                                  setState(() {
                                    if (causeOfCancellation != null) {
                                      undelivered = causeOfCancellation;
                                      notMatchDescription =
                                          !causeOfCancellation;
                                      otherCauses = !causeOfCancellation;
                                    }
                                  });
                                }),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Не доставлен',
                              style: TextStyle(
                                color: !undelivered
                                    ? Color.fromARGB(
                                        255,
                                        152,
                                        162,
                                        165,
                                      )
                                    : Color.fromARGB(
                                        255, 2, 54, 70), // Update text color
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat", fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 14,
                            width: 14,
                            child: Checkbox(
                                value: notMatchDescription,
                                activeColor: Color.fromARGB(255, 2, 54, 70),
                                tristate: true,
                                shape: CircleBorder(),
                                onChanged: (causeOfCancellation) {
                                  setState(() {
                                    if (causeOfCancellation != null) {
                                      notMatchDescription = causeOfCancellation;
                                      undelivered = !causeOfCancellation;
                                      otherCauses = !causeOfCancellation;
                                    }
                                  });
                                }),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Не соответствует к описанию',
                              style: TextStyle(
                                color: !notMatchDescription
                                    ? Color.fromARGB(
                                        255,
                                        152,
                                        162,
                                        165,
                                      )
                                    : Color.fromARGB(
                                        255, 2, 54, 70), // Update text color
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat", fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 14,
                            width: 14,
                            child: Checkbox(
                                value: otherCauses,
                                activeColor: Color.fromARGB(255, 2, 54, 70),
                                tristate: true,
                                shape: CircleBorder(),
                                onChanged: (causeOfCancellation) {
                                  setState(() {
                                    if (causeOfCancellation != null) {
                                      otherCauses = causeOfCancellation;
                                      undelivered = !causeOfCancellation;
                                      notMatchDescription =
                                          !causeOfCancellation;
                                    }
                                  });
                                }),
                          ),
                          Container(
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Другие причины',
                                style: TextStyle(
                                  color: !otherCauses
                                      ? Color.fromARGB(
                                          255,
                                          152,
                                          162,
                                          165,
                                        )
                                      : Color.fromARGB(
                                          255, 2, 54, 70), // Update text color
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat", fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 243, 244, 245)),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text(
                          'Отмена',
                          style:
                              TextStyle(color: Color.fromARGB(255, 2, 54, 70)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: StatefulBuilder(builder: (context, setState) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: (undelivered ||
                                    notMatchDescription ||
                                    otherCauses)
                                ? Color.fromARGB(255, 2, 54, 70)
                                : Color.fromARGB(255, 2, 54, 70)
                                    .withOpacity(0.7),
                          ),
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text(
                            'Продолжить',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      child: const Text(
        "Отменить заказ",
        style: TextStyle(
            color: Color.fromARGB(204, 219, 26, 26),
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
