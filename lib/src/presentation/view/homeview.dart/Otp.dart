import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp extends StatefulWidget {
  Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            margin: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
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
              Text("Enter Otp",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              OtpTextField(
                numberOfFields: 6,
                textStyle: TextStyle(color: Colors.white),
                borderColor: Color.fromARGB(255, 204, 221, 207),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                },
              ),
              Text(
                "Otp has Sent",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Otp has Sent",
                style: TextStyle(color: Colors.white, fontSize: 16),
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
                    child: const Text('Verify & Continue',
                        style: TextStyle(fontSize: 20)),
                    onPressed: () async {
                      //  Route route = MaterialPageRoute(
                      //             builder: (context) => (()));
                      //         Navigator.push(context, route);
                    },
                  ))),
            ])));
  }
}
