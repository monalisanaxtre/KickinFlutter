import 'package:flutter/material.dart';
import 'package:kickinn/src/data/loginmodel.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;
  late String email, password;
  bool isLoading = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  late String emailControllerErrorText;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
            child: Container(
                color: Colors.green,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/cross.png'),
                          SizedBox(width: 40),
                          Image.asset(
                            'assets/kick_inn_logo.png',
                            height: 120,
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
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          hintStyle:
                              TextStyle(fontSize: 20.0, color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        controller: passwordController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle:
                              TextStyle(fontSize: 20.0, color: Colors.white),
                          border: OutlineInputBorder(
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
                              child: FlatButton(
                            textColor: Colors.white,
                            child: const Text('Sign In',
                                style: TextStyle(fontSize: 20)),
                            onPressed: () {
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
                              login(
                                  emailController.text,
                                  passwordController.text,
                                  "android",
                                  "ezO7GNQQRp-tVVEyp-E9PW:APA91bH3LLUX92tbn6g4NZ3y6SbBxz9BQKfCAMSHLVJL-wRYnOZ1ZfEVL7bSnVh_YnY1gq3URUHsUaSTpIASx4v3qD5I3mO8XzP2I86jiXabNWWpfByEr98s8G8o6w1kRgBoY-Rifv2e");
                              setState(() {
                                isLoading = true;
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                              setState(() {});
                            },
                          ))),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ])))));
  }

  Future<LoginResponse> login(email, password, deviceType, deviceToken) async {
    var data = {
      'email': email,
      'password': password,
      'device_type': deviceType,
      'device_token': deviceToken,
    };
    print(data.toString());

    var headers = {
      "content-type": "application/json",
    };
    var body = data;
    var response = await http.post(
        Uri.parse('https://www.naxtre.com/kickin-inn_dev/api/login'),
        headers: headers,
        body: json.encode(body));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      return LoginResponse.fromJson(jsonMap);
    } else {
      throw Exception("Failed to load data");
    }
  }

  savePref(int value, String name, String email, int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt("value", value);
    preferences.setString("name", name);
    preferences.setString("email", email);
    preferences.setString("id", id.toString());
    preferences.commit();
  }
}
