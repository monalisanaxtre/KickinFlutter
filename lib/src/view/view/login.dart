import 'package:flutter/material.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool value = false;
//   late String email, password;
//   bool isLoading = false;
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.green,
//         body: Center(
//             child: Container(
//                 color: Colors.green,
//                 margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 70,
//                       ),
//                       Row(
//                         children: [
//                           Image.asset('assets/cross.png'),
//                           SizedBox(width: 40),
//                           Image.asset(
//                             'assets/kick_inn_logo.png',
//                             height: 120,
//                           ),
//                         ],
//                       ),
//                       // SizedBox(height: 10),
//                       Text(
//                         "SignIn",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                         controller: emailController,
//                         // validator: validateEmail,
//                         // onSaved: (String value) {
//                         //   email = value;
//                         // },
//                         keyboardType: TextInputType.emailAddress,
//                         style: TextStyle(fontSize: 20),
//                         decoration: InputDecoration(
//                           hintText: "Enter Email",
//                           hintStyle:
//                               TextStyle(fontSize: 20.0, color: Colors.white),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.teal,
//                             ),
//                           ),
//                           prefixIcon: const Icon(
//                             Icons.email,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         controller: passwordController,
//                         // onSaved: (String value) {
//                         //   email = value;
//                         // },
//                         style: TextStyle(fontSize: 20),
//                         decoration: InputDecoration(
//                           hintText: "Password",
//                           hintStyle:
//                               TextStyle(fontSize: 20.0, color: Colors.white),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                             ),
//                           ),
//                           prefixIcon: const Icon(
//                             Icons.lock,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Forgot Password",
//                             textAlign: TextAlign.start,
//                             style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),

//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Checkbox(
//                               checkColor: Colors.white,
//                               value: this.value,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   this.value = value!;
//                                 });
//                               }),
//                           Column(
//                             children: [
//                               Text(
//                                 "By logging in,I agree with Kickin\'Inn\'s",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.normal),
//                               ),
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               Text(
//                                 "Terms & Conditions & Privacy Policy",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.normal),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                           height: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: new BorderRadius.circular(10),
//                             color: Colors.red,
//                           ),
//                           child: Center(
//                               child: FlatButton(
//                             textColor: Colors.white,
//                             child: const Text('Sign In',
//                                 style: TextStyle(fontSize: 20)),
//                             onPressed: () {
//                               if (isLoading) {
//                                 return;
//                               }
//                               if (emailController.text.isEmpty ||
//                                   passwordController.text.isEmpty) {
//                                 SnackBar(content: Text("please fill it "));
//                                 return;
//                                 // scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Fill all fileds")));
//                                 // return;
//                               }
//                               login(
//                                   emailController.text,
//                                   passwordController.text,
//                                   "android",
//                                   "ezO7GNQQRp-tVVEyp-E9PW:APA91bH3LLUX92tbn6g4NZ3y6SbBxz9BQKfCAMSHLVJL-wRYnOZ1ZfEVL7bSnVh_YnY1gq3URUHsUaSTpIASx4v3qD5I3mO8XzP2I86jiXabNWWpfByEr98s8G8o6w1kRgBoY-Rifv2e");
//                               setState(() {
//                                 isLoading = true;
//                               });

//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => Home()),
//                               );
//                               setState(() {});
//                             },
//                           ))),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don\'t have account?",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.normal),
//                           ),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Text(
//                             "Sign up",
//                             style: TextStyle(
//                                 color: Colors.red,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.normal),
//                           ),
//                         ],
//                       )
//                     ]))));
//   }

//   login(email, password, deviceType, deviceToken) async {
//     Map data = {
//       'email': email,
//       'password': password,
//       'deviceType': deviceType,
//       'deviceToken': deviceToken,
//     };
//     print(data.toString());
//     final response = await http.post(
//         Uri.parse("https://www.naxtre.com/kickin-inn_dev/api/login"),
//         headers: {
//           "Accept": "application/json",
//           "Content-Type": "application/x-www-form-urlencoded"
//         },
//         body: data,
//         encoding: Encoding.getByName("utf-8"));
//     setState(() {
//       isLoading = false;
//     });
//     if (response.statusCode == 200) {
//       Map<String, dynamic> resposne = jsonDecode(response.body);
//       if (!resposne['error']) {
//         Map<String, dynamic> user = resposne['data'];
//         print(" User name ${user['id']}");
//         savePref(1, user['name'], user['email'], user['id']);
//         Navigator.pushReplacementNamed(context, "/home");
//       } else {
//         print(" ${resposne['message']}");
//       }
//       // scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne['message']}")));

//     } else {
//       // scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please try again!")));
//     }
//   }

//   savePref(int value, String name, String email, int id) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();

//     preferences.setInt("value", value);
//     preferences.setString("name", name);
//     preferences.setString("email", email);
//     preferences.setString("id", id.toString());
//     preferences.commit();
//   }

//   String validateEmail(String value) {
//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regExp = new RegExp(pattern);
//     if (value.length == 0) {
//       return "Email is Required";
//     } else if (!regExp.hasMatch(value)) {
//       return "Invalid Email";
//     } else {
//       return "";
//     }
//   }
// }
