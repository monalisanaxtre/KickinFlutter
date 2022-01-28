import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
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
              width: 120,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
              ),
              child: Image.asset('assets/f.jpg'),
              height: 120,
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
                    // Route route = MaterialPageRoute(
                    //     builder: (context) => );
                    // Navigator.push(context, route);
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
          ],
        ));
  }
}
