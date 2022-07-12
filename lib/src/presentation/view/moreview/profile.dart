import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/profile.dart';
import 'package:kickinn/src/data/profilemodel.dart';
import 'package:kickinn/src/presentation/view/moreview/editprofile.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileModel _profileModel;
  @override
  void initState() {
    super.initState();
    viewProfile("25").then((profileview) {
      setState(() {
        _profileModel = profileview;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                  Navigator.pop(context, false);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Profile",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 21),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              "Log Out",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ]),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    color: Colors.blueGrey,
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width / 0.3,
                    child: Column(children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                              size: Size.fromRadius(48),
                              child: Image(
                                image:
                                    NetworkImage(_profileModel.data.userPhoto),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          color: Colors.blueGrey,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Username ",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    _profileModel.data.firstName,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Phone No ",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    _profileModel.data.phoneNumber,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Text(
                              //       "Email",
                              //       style: TextStyle(
                              //           fontSize: 16, color: Colors.white),
                              //     ),
                              //     Text(
                              //       _profileModel.data.email,
                              //       maxLines: 2,
                              //       style: TextStyle(
                              //           fontSize: 16, color: Colors.white),
                              //     ),
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Gender ",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    _profileModel.data.gender,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Date Of Birth ",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    _profileModel.data.dob,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        color: Colors.red,
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => (EditProfile()));
                          Navigator.push(context, route);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                            "Edit Profile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
                  )
                ]))));
  }
}
