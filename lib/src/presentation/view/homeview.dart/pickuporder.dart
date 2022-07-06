import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/getAllBagItem.dart';
import 'package:kickinn/src/data/getallbagitemmodel.dart';

class PickupOrder extends StatefulWidget {
  PickupOrder({Key? key}) : super(key: key);

  @override
  State<PickupOrder> createState() => _PickupOrderState();
}

class _PickupOrderState extends State<PickupOrder> {
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var time = now.hour.toString() + ":" + now.minute.toString();

    print(now.hour.toString() +
        ":" +
        now.minute.toString() +
        ":" +
        now.second.toString());
    return Scaffold(
        backgroundColor: Colors.black,
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
                    color: Colors.blueGrey,
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 40,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Pickup",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal)),
                            SizedBox(
                              width: 110,
                            ),
                            Text("change Address",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Saint Marry",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal))
                          ])
                    ])),
                Text("Choose your Time",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                ),
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: TextStyle(color: Colors.green),
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                FutureBuilder<GetAllBagItem>(
                    future: getAllBagItem("23", time),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, position) {
                              return Container(
                                  height: 80,
                                  color: Colors.blueGrey,
                                  child: Column(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              snapshot.data!.data
                                                  .bagItems[position].itemName,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          SizedBox(
                                            width: 110,
                                          ),
                                          Text(
                                              snapshot.data!.data
                                                  .bagItems[position].price,
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.normal))
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              snapshot.data!.data
                                                  .bagItems[position].qty,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight:
                                                      FontWeight.normal))
                                        ]),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit),
                                        ),
                                        SizedBox(width: 10),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete),
                                        ),
                                      ],
                                    )
                                  ]));
                            });
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        color: Colors.white,
                        onPressed: () {
                          // Route route = MaterialPageRoute(
                          //     builder: (context) => WebViewStack());
                          // Navigator.push(context, route);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Text(
                            "Order More",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      MaterialButton(
                        color: Colors.red,
                        onPressed: () {
                          // Route route = MaterialPageRoute(
                          //     builder: (context) => ());
                          // Navigator.push(context, route);
                        },
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              "Check Out",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
