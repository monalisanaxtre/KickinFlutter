import 'package:flutter/material.dart';

class StoreFragment extends StatefulWidget {
  StoreFragment({Key? key}) : super(key: key);

  @override
  State<StoreFragment> createState() => _StoreFragmentState();
}

class _StoreFragmentState extends State<StoreFragment> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    IconButton(
                      alignment: Alignment.topLeft,
                      icon: Icon(Icons.card_travel_sharp),
                      iconSize: 28.0,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    Image.asset(
                      'assets/kick_inn_logo.png',
                      height: 120,
                    ),
                    IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(Icons.card_travel_sharp),
                      iconSize: 28.0,
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ]),
                  StoreList()
                ]))));
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
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Container(
                height: 125,
                width: 120,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Kickinn",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.share_location_outlined,
                                  size: 35.0,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "hi",
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_right_outlined,
                                size: 35.0,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 2.0,
                      color: Colors.grey,
                    )
                  ],
                ));
          },
          itemCount: 10,
        ));
  }
}
