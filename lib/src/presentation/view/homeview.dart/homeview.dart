import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/recommend.dart';
import 'package:kickinn/src/data/recommend.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/storeview.dart';
import 'package:kickinn/src/view/view/orderfragment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/storyModel.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late RecommendModel recommendModel;
  late Story story;

  @override
  void initState() {
    super.initState();
    getStory().then((storydes) {
      setState(() {
        story = storydes;
      });
    });

    getrecommendFood().then((foodlist) {
      setState(() {
        recommendModel = foodlist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<RecommendModel>(
            future: getrecommendFood(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  color: Colors.black,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/kick_inn_logo.png',
                              height: 120,
                            ),
                            IconButton(
                              alignment: Alignment.centerRight,
                              icon: Icon(Icons.card_travel_sharp),
                              iconSize: 28.0,
                              color: Colors.white,
                              onPressed: () {},
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.grey),
                        ),
                        child: Image.asset('assets/f.jpg'),
                        height: 200,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.red,
                            onPressed: () {
                              // Route route =
                              //     MaterialPageRoute(builder: (context) => );
                              // Navigator.push(context, route);
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                "Dine In",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          RaisedButton(
                            color: Colors.red,
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => StoreFragment());
                              Navigator.push(context, route);
                            },
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  "Order",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "We Recommend",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        height: 150,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, position) {
                              return Column(children: [
                                Container(
                                  height: 120,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: Colors.grey),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(snapshot
                                          .data!.data[position].itemImage),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.data[position].itemName,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ]);
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              story.data.description,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}



// story api
Future<Story> getStory() async {
  var response = await http.get(
      Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/get_app_story'));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    return Story.fromJson(jsonMap);
  } else {
    throw Exception("Failed to load data");
  }
}
