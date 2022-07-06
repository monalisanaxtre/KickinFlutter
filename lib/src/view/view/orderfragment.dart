import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/recentOrder.dart';
import 'package:kickinn/src/data/recentOrder.dart';

class OrderFragment extends StatefulWidget {
  const OrderFragment({Key? key}) : super(key: key);

  @override
  State<OrderFragment> createState() => _OrderFragmentState();
}

class _OrderFragmentState extends State<OrderFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<RecentOrder>(
            future: getRecentOrder("23"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, position) {
                      return Container(
                          height: 125,
                          width: 120,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snapshot.data!.data[position]
                                      .itemDetails[position].itemName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data!.data[position].amntPaid,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  " // snapshot.data!.data[position].storeName!,",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  snapshot.data!.data![position].orderPlacedOn!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                              ]));
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
