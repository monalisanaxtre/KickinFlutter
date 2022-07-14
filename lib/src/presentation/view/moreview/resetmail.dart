import 'package:flutter/material.dart';

class ResetEmail extends StatefulWidget {
  ResetEmail({Key? key}) : super(key: key);

  @override
  State<ResetEmail> createState() => _ResetEmailState();
}

class _ResetEmailState extends State<ResetEmail> {
  final TextEditingController resetEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            margin: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Image.asset(
                      'assets/kick_inn_logo.png',
                      height: 120,
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Text("Reset Email",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                TextFormField(
                  controller: resetEmailController,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(1),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: MaterialButton(
                      textColor: Colors.white,
                      child:
                          const Text('Submit', style: TextStyle(fontSize: 20)),
                      onPressed: () async {
                        //  Route route = MaterialPageRoute(
                        //             builder: (context) => (()));
                        //         Navigator.push(context, route);
                      },
                    ))),
              ],
            )));
  }
}
