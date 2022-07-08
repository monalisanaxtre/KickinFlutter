import 'package:flutter/material.dart';
import 'package:kickinn/src/presentation/view/moreview/promotionfragment.dart';
import 'package:kickinn/src/view/view/orderfragment.dart';

class MoreFragment extends StatefulWidget {
  MoreFragment({Key? key}) : super(key: key);

  @override
  State<MoreFragment> createState() => _MoreFragmentState();
}

class _MoreFragmentState extends State<MoreFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                      Navigator.pop(context, false);
                    },
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Image.asset(
                  'assets/kick_inn_logo.png',
                  height: 100,
                ),
              ]),
              Container(
                  height: 60,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 60,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (() {
                  Route route =
                      MaterialPageRoute(builder: (context) => OrderFragment());
                  Navigator.push(context, route);
                }),
                child: Container(
                    height: 60,
                    color: Colors.blueGrey,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.alarm,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(width: 30),
                        Text(
                          "Recent",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 115,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 60,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 60,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 30),
                      Text(
                        "About",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 60,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Contact",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => PromotionFragment());
                  Navigator.push(context, route);
                },
                child: Container(
                    height: 60,
                    color: Colors.blueGrey,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.local_offer,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Promotional",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 115,
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 60,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Setting",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 115,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
