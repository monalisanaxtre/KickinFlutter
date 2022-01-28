import 'package:flutter/material.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/home.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;
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
                      TextField(
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
                      TextField(
                        obscureText: true,
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
                    ]))));
  }
}
