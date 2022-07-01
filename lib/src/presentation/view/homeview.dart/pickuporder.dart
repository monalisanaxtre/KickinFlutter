import 'dart:html';

import 'package:flutter/material.dart';

class PickupOrder extends StatefulWidget {
  PickupOrder({Key? key}) : super(key: key);

  @override
  State<PickupOrder> createState() => _PickupOrderState();
}

class _PickupOrderState extends State<PickupOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/cross.png',
                      height: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Your Order",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  height: 80,
                  color: Colors.red,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(image: AssetImage("assets/f.jpeg")),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Pickup",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.normal))
                      ]),
                )
              ],
            )));
  }
}
// kickin-starterdetail ui and api,issue pending of api ,build issue fix .er