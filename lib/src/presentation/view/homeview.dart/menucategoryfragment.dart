import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/menucategory.dart';
import 'package:kickinn/src/data/menucategory.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kickinn/src/presentation/view/homeview.dart/menu.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/storeview.dart';

class MenuCategory extends StatefulWidget {
  MenuCategory({Key? key}) : super(key: key);

  @override
  State<MenuCategory> createState() => _MenuCategoryState();
}

class _MenuCategoryState extends State<MenuCategory> {
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
                  height: 30,
                  width: 30,
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
                  onPressed: () {},
                )
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
            MenuCategoryList(),
          ]),
        ));
  }
}

class MenuCategoryList extends StatefulWidget {
  MenuCategoryList({Key? key}) : super(key: key);

  @override
  State<MenuCategoryList> createState() => _MenuCategoryListState();
}

class _MenuCategoryListState extends State<MenuCategoryList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.1;
    final double itemWidth = size.width / 2;
    return Expanded(
        child: FutureBuilder<MenuCategoryModel>(
            // future: getMenuCategoryList("1", "23"),
            future: getMenuCategoryList(MenuList.catagoryId,StoreFragment.storeId),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(9, 4, 9, 0),
                              child: Container(
                                  child: InkWell(
                                      child: Column(
                                        children: <Widget>[
                                        Container(
                                          child: Card(
                                            semanticContainer: true,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: AspectRatio(
                                              aspectRatio: 20.0 / 18.0,
                                              child: Image.network(
                                                snapshot
                                                    .data!.data[index].image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot
                                                .data!.data[index].itemName
                                                .toUpperCase(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          
                                             textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                      ]),
                                      onTap: () {}))));
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
