import 'package:flutter/material.dart';

class MoreFragment extends StatefulWidget {
  MoreFragment({Key? key}) : super(key: key);

  @override
  State<MoreFragment> createState() => _MoreFragmentState();
}

class _MoreFragmentState extends State<MoreFragment> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Container(
          margin: EdgeInsets.all(10),
          width: 40,
          color: Colors.red,
          child: Row(children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 30.0,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Icon(
                Icons.arrow_right_alt_outlined,
                color: Colors.white,
                size: 30.0,
              ),
            ]),
          ])),
    )));
  }
}
