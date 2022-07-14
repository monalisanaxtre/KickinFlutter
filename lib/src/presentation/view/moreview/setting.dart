import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Setting extends StatefulWidget {
  Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitchOn = false;
  bool isSwitchOnEmail = false;
  bool isSwichOnDeleteAccount = false;
  bool isPushNotification = false;

  bool isPromotionalEmail = false;

  bool isShareLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Column(children: [
                  SizedBox(
                    height: 40,
                  ),
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      "Setting",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
                  SizedBox(height: 30),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 43, 42, 42),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.notifications,
                            size: 32,
                            color: Colors.white,
                          ),
                          Text(
                            "Push Notification",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          FlutterSwitch(
                            value: isPushNotification,
                            activeColor: Colors.red,
                            inactiveColor: Colors.grey,
                            onToggle: (value) {
                              setState(() {
                                isPushNotification = value;
                              });
                            },
                          ),
                        ]),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 43, 42, 42),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 32,
                            color: Colors.white,
                          ),
                          Text(
                            "Share Location",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          FlutterSwitch(
                            value: isShareLocation,
                            activeColor: Colors.red,
                            inactiveColor: Colors.grey,
                            onToggle: (value) {
                              setState(() {
                                isShareLocation = value;
                              });
                            },
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 43, 42, 42),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.email_sharp,
                            size: 32,
                            color: Colors.white,
                          ),
                          Text(
                            "Promotional Email",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          FlutterSwitch(
                            value: isPromotionalEmail,
                            activeColor: Colors.red,
                            inactiveColor: Colors.grey,
                            onToggle: (value) {
                              setState(() {
                                isPromotionalEmail = value;
                              });
                            },
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 43, 42, 42),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.delete,
                            size: 32,
                            color: Colors.white,
                          ),
                          Text(
                            "Delete Account",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          FlutterSwitch(
                            value: isSwichOnDeleteAccount,
                            activeColor: Colors.red,
                            inactiveColor: Colors.grey,
                            onToggle: (value) {
                              setState(() {
                                isSwichOnDeleteAccount = value;
                              });
                            },
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    color: Color.fromARGB(255, 43, 42, 42),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.mark_email_read,
                            size: 32,
                            color: Colors.white,
                          ),
                          Text(
                            "Change Email",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          FlutterSwitch(
                            value: isSwitchOnEmail,
                            activeColor: Colors.red,
                            inactiveColor: Colors.grey,
                            onToggle: (value) {
                              setState(() {
                                isSwitchOnEmail = value;
                              });
                            },
                          ),
                        ]),
                  ),
                ]))));
  }
}
