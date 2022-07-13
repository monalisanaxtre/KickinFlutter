import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/orderconfirmation.dart';

class PlaceOrder extends StatefulWidget {
  PlaceOrder({Key? key}) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  int index = 0;

  bool goNext = false;
  bool goPrevious = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.red,
                  child: IconButton(
                    alignment: Alignment.topLeft,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 28.0,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Text(
                  "Place Order",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ]),
              NumberStepper(numbers: [1, 2]),
              Text(
                "Pickup Details",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 60,
                  color: Color.fromARGB(255, 102, 100, 100),
                  margin: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pickup Address",
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )),
              Row(
                children: [
                  Text(
                    "Promo Code",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    color: Color.fromARGB(96, 88, 87, 87),
                    child: Text("Enter Promo Code here",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: Text(
                        "Apply",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Order Summery",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 60,
                  color: Color.fromARGB(255, 107, 105, 105),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Order Total",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "GST",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 50,
              ),
              Divider(
                height: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "To Pay",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(1),
                    color: Colors.red,
                  ),
                  child: Center(
                      child: MaterialButton(
                    textColor: Colors.white,
                    child: const Text('Place Order',
                        style: TextStyle(fontSize: 20)),
                    onPressed: () async {
                     Route route = MaterialPageRoute(
                                builder: (context) => (OrderConfirmation()));
                            Navigator.push(context, route);
                    },
                  ))),
            ])));
  }
}
