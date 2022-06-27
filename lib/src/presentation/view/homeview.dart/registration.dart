import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(0, 255, 230, 6),
        body: Center(
            child: Container(
                color: Colors.yellow,
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
                        "SignUp",
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
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "FirstName",
                          fillColor: Colors.red,
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
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
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "LastName",
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.white),
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
                      TextFormField(
                        controller: passwordController,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "PhoneNumber",
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.white),
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
                      TextFormField(
                        controller: passwordController,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.white),
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
                      TextFormField(
                        controller: passwordController,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.white),
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
                      TextFormField(
                        controller: passwordController,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.white),
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
                      TextFormField(
                        controller: passwordController,
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "PostCode",
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: Colors.white),
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
                    ])))));
  }
}
