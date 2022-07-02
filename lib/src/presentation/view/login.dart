import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/Login.dart';
import 'package:kickinn/src/data/loginfailedModel.dart';
import 'package:kickinn/src/data/loginmodel.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/home.dart';
import 'package:http/http.dart' as http;
import 'package:kickinn/src/presentation/view/homeview.dart/registration.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String? userId;
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;
  late String email, password;
  bool isLoading = false;

  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  late String emailControllerErrorText;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   super.initState();
  //   var tokenn = _firebaseMessaging.getToken().then((tokenn) {
  //     print(tokenn);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: GestureDetector(child:Container(
                color: Colors.black,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Form(
                    child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/cross.png',
                        height: 40,
                      ),
                      SizedBox(width: 70),
                      Image.asset(
                        'assets/kick_inn_logo.png',
                        height: 100,
                      ),
                    ],
                  ),
                  // SizedBox(height: 10),
                  Text(
                    "SignIn",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
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
                    // validator: validateEmail,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
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
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Forgot Password",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          side: BorderSide(color: Colors.white),
                          checkColor: Colors.white,
                          value: this.value,
                          onChanged: (bool? value) {
                            setState(() {
                              this.value = value!;
                            });
                          }),
                      Column(
                        children: [
                          Text(
                            "By logging in,I agree with Kickin\'Inn\'s",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Terms & Conditions & Privacy Policy",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: Center(
                          child: MaterialButton(
                        textColor: Colors.white,
                        child: const Text('Sign In',
                            style: TextStyle(fontSize: 20)),
                        onPressed: () async {
                          if (isLoading) {
                            return;
                          }
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            SnackBar(content: Text("please fill it "));
                            return;
                            // scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Fill all fileds")));
                            // return;
                          }
                          var loginData = await login(
                              emailController.text,
                              passwordController.text,
                              "android",
                              "ezO7GNQQRp-tVVEyp-E9PW:APA91bH3LLUX92tbn6g4NZ3y6SbBxz9BQKfCAMSHLVJL-wRYnOZ1ZfEVL7bSnVh_YnY1gq3URUHsUaSTpIASx4v3qD5I3mO8XzP2I86jiXabNWWpfByEr98s8G8o6w1kRgBoY-Rifv2e");

                          print(loginData.runtimeType);

                          if (loginData.runtimeType == LoginResponse) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),);
                               setState(() {});
                          } else {
                            print("\111111111111111111111");
                            print("Loginfailed");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(loginData.error.toString()),
                            ));
                          }

                         
                        },
                      ))),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Don\'t have account?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registration()),
                        );
                      },
                    )
                  ])
                ]))),
                onTap:(){
              

                } ,
                )
                )
                );
  }

  savePref(int value, String name, String email, int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt("value", value);
    preferences.setString("name", name);
    preferences.setString("email", email);
    preferences.setString("id", id.toString());
    preferences.commit();
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return "null";
    }
  }
}
