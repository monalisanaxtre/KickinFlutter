import 'package:flutter/material.dart';

class OrderConfirmation extends StatefulWidget {
  OrderConfirmation({Key? key}) : super(key: key);

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(
                    height: 130,
                  ),
                  Icon(
                    Icons.access_alarm,
                    size: 22,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Thank you for your Order:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 200,
                      width: 300,
                      color: Colors.grey,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Order Confirmation:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              "11:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Number:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Phone Number:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ]),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ]),
                      ])),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: SizedBox(
                    width: 220,
                    height: 60,
                    child: TextButton(
                      onHover: (value) {},
                      onPressed: (() => {}),
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.red))),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(240, 190, 52, 10)),
                      ),
                    ),
                  ))
                ]))));
  }
}
