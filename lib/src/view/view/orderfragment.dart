import 'package:flutter/material.dart';

class OrderFragment extends StatefulWidget {
  const OrderFragment({Key? key}) : super(key: key);

  @override
  State<OrderFragment> createState() => _OrderFragmentState();
}

class _OrderFragmentState extends State<OrderFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: Colors.pink,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
                height: 100,
                width: 100,
                color: Colors.orange,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "item Name",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "79.00",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "storeName",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "24.05.2022",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ]))));
  }
}
