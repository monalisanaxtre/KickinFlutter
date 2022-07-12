import 'dart:io';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kickinn/servicewrapper/editprofile.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

enum ImageSourceType { gallery, camera }

class _EditProfileState extends State<EditProfile> {
  File? image;

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  late String _myActivity;
  late String _myActivityResult;

  final formKey = new GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
            child: Form(
          key: formKey,
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
                  width: 15,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                          size: Size.fromRadius(48),
                          child: Image(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-XLvCNEIXTB7AJ7G1745y6remkBpxymlk6Q&usqp=CAU"),
                          )),
                    ),
                  ),
                  Positioned(
                      right: 3,
                      bottom: 3,
                      child: IconButton(
                          onPressed: () {
                            showGalleryDialog();
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            size: 22,
                            color: Colors.red,
                          )))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nameController,
                style: TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Enter Name",
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
                height: 10,
              ),
              TextFormField(
                controller: lastnameController,
                style: TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Enter last Name",
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
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                style: TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "email",
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
                height: 10,
              ),
              TextFormField(
                controller: mobileController,
                style: TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Phone No",
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
                height: 10,
              ),
              TextFormField(
                controller: dobController,
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());
                  date = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100)))!;

                  dobController.text = date.toString();
                },
                style: TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Dob",
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
                height: 10,
              ),
              DropDownFormField(
                hintText: 'Please choose one',
                value: _myActivity,
                onSaved: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                dataSource: [
                  {
                    "display": "Female",
                    "value": "Female",
                  },
                  {
                    "display": "Male",
                    "value": "Male",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),

              // TextFormField(
              //   controller: genderController,
              //   style: TextStyle(fontSize: 16, color: Colors.white),
              //   decoration: InputDecoration(
              //     fillColor: Colors.white,
              //     hintText: "Gender",
              //     hintStyle: TextStyle(color: Colors.white),
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.white,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.white,
              //       ),
              //     ),
              //     prefixIcon: const Icon(
              //       Icons.email,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: SizedBox(
                width: 150,
                height: 60,
                child: TextButton(
                  onHover: (value) {},
                  onPressed: (() => {
                        editProfile(
                            "23",
                            nameController.text,
                            lastnameController.text,
                            mobileController.text,
                            genderController.text,
                            dobController.text,
                            emailController.text)
                      }),
                  child: Text(
                    "update",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.red))),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(240, 190, 52, 10)),
                  ),
                ),
              ))
            ]),
          ),
        )));
  }

  showGalleryDialog() {
    return Container(
        color: Colors.pink,
        height: 150,
        width: 200,
        child: Center(
          child: Column(
            children: [
              MaterialButton(
                  color: Colors.blue,
                  child: const Text("Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    _handleURLButtonPress(context, ImageSourceType.gallery);
                  }),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text("Pick Image from Camera",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    _handleURLButtonPress(context, ImageSourceType.camera);
                  }),
            ],
          ),
        ));
  }
}

class ImageFromGalleryEx extends StatefulWidget {
  final type;
  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  var _image;
  var imagePicker;
  var type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(type == ImageSourceType.camera
              ? "Image from Camera"
              : "Image from Gallery")),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(color: Colors.red[200]),
                child: _image != null
                    ? Image.file(
                        _image,
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.red[200]),
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
