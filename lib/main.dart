import 'package:flutter/material.dart';
import 'package:kickinn/src/presentation/view/getstarted.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      builder: (context, snapshot) =>
          MaterialApp(debugShowCheckedModeBanner: false, home: getStarted()),
    );
  }
}
