import 'package:flutter/material.dart';
import 'package:kickinn/src/presentation/view/login.dart';

class getStarted extends StatelessWidget {
  const getStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.black,
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset(
            'assets/kick_inn_logo.png',
            height: 120,
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/scooter.png',
            height: 120,
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text(
                '    Sign In    ',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
