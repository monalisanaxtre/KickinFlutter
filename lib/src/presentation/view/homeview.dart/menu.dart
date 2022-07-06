import 'package:flutter/material.dart';
import 'package:kickinn/src/data/menuModel.dart';
import 'package:http/http.dart' as http;
import 'package:kickinn/src/presentation/view/homeview.dart/menu.dart';
import 'dart:convert';

import 'package:kickinn/src/presentation/view/homeview.dart/menucategoryfragment.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/pickuporder.dart';

class MenuFragment extends StatefulWidget {
  MenuFragment({Key? key}) : super(key: key);

  @override
  State<MenuFragment> createState() => _MenuFragmentState();
}

class _MenuFragmentState extends State<MenuFragment> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/kick_inn_logo.png',
                  height: 100,
                ),
                IconButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.card_travel_sharp),
                    iconSize: 28.0,
                    color: Colors.white,
                    onPressed: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => PickupOrder());
                      Navigator.push(context, route);
                    })
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image.asset('assets/f.jpg'),
              height: 200,
            ),
            MenuList(),
          ]),
        ));
  }
}

class MenuList extends StatefulWidget {
  static String? catagoryId;
  MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<Menu>(
            future: getMenuList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data.length,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            snapshot.data!.data[position].icon),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    snapshot.data!.data[position].name,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          MenuList.catagoryId =
                              snapshot.data!.data[position].categoryId;

                          Route route = MaterialPageRoute(
                              builder: (context) => MenuCategory());
                          Navigator.push(context, route);
                        });
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

Future<Menu> getMenuList() async {
  var response = await http.get(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/menu_categories'));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    return Menu.fromJson(jsonMap);
  } else {
    throw Exception("Failed to load data");
  }
}
