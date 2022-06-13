import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/recommend.dart';
import 'package:kickinn/src/data/recommend.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/storeview.dart';
import 'package:kickinn/src/view/view/orderfragment.dart';

class HomeView extends StatefulWidget {
  final RecommendModel recommend;
  HomeView({Key? key, @required this.recommend}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState(recommend);
}

class _HomeViewState extends State<HomeView> {
  RecommendModel recommend;

  _HomeViewState(this.recommend);
  bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Recommend.recommendfoodlist().then((foodlist) {
      setState(() {
        recommend = foodlist;
        _loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      height: 100.0,
                      child: FutureBuilder<RecommendModel>(
                          future: Recommend.recommendfoodlist(),
                          builder: (context, snapshot){
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data?.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // This next line does the trick.
                                    scrollDirection:
                                    Axis.horizontal;
                                    // ignore: unnecessary_statements
                                    children:
                                    <Widget>[
                                      Container(
                                        width: 160.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3, color: Colors.grey),
                                          // image: DecorationImage(
                                          //   fit: BoxFit.fill,
                                          //   // image: Image.network(snapshot.data.data.length)
                                          // ),
                                        ),
                                      ),
                                    ];
                                  });
                            }
                          })),
                  Column(children: [
                    Row(
                      children: [
                        Text(
                          "Story",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Good Quality makes it ..",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                  ]),
                ])));
  }
}
