import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kickinn/src/presentation/view/homeview.dart/menu.dart';
import 'dart:convert';

import '../../../data/storemodel.dart';

class StoreFragment extends StatefulWidget {
  @override
  _StoreFragmentState createState() => _StoreFragmentState();
}

class _StoreFragmentState extends State<StoreFragment> {
  late Store storelist;

  @override
  void initState() {
    super.initState();
    getStoreList().then((storeList) {
      setState(() {
        storelist = storeList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              height: 40,
              width: 40,
              color: Colors.red,
              child: IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(Icons.arrow_back),
                iconSize: 28.0,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Image.asset(
              'assets/kick_inn_logo.png',
              height: 100,
            ),
            IconButton(
              alignment: Alignment.topRight,
              icon: Icon(Icons.card_travel_sharp),
              iconSize: 28.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ]),
          Expanded(child: StoreList())
        ]));
  }
}

class StoreList extends StatefulWidget {
  StoreList({Key? key}) : super(key: key);

  @override
  State<StoreList> createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Store>(
      future: getStoreList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, position) {
                return GestureDetector(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        height: 80,
                        width: 80,
                        color: Colors.grey[800],
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        snapshot.data!.data[position].storeName,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.share_location_outlined,
                                          size: 35.0,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          snapshot.data!.data[position]
                                              .storeAddress,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.arrow_right_alt_sharp,
                                        size: 35.0,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => MenuFragment());
                      Navigator.push(context, route);
                    });
              },
              itemCount: snapshot.data!.data.length);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Future<Store> getStoreList() async {
  var response = await http
      .get(Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/getAllStores'));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    return Store.fromJson(jsonMap);
  } else {
    throw Exception("Failed to load data");
  }
}
