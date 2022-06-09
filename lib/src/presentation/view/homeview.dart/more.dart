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
      color: Colors.red,
      child: ListView.builder(itemBuilder: (context, position) {
        return Container(
          height: 100,
          width: 100,
        );
      }),
    )));
  }
}
