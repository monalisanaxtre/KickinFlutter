import 'package:flutter/material.dart';
import 'package:kickinn/src/data/addressmodel.dart';

import '../../../../servicewrapper/addaddress.dart';

class AddressFragment extends StatefulWidget {
  AddressFragment({Key? key}) : super(key: key);

  @override
  State<AddressFragment> createState() => _AddressFragmentState();
}

class _AddressFragmentState extends State<AddressFragment> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController houseNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  // final TextEditingController message = TextEditingController();
  // String name, email;
  // Future<AddressModel> addressModel;
  bool _validate = false;
  GlobalKey<FormState> _key = new GlobalKey();
  late AddressModel addressModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Form(
                key: _key,
                // autovalidate: _validate,
                child: Container(
                    color: Colors.black,
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "Add Address",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ]),
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
                            controller: mobileController,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Phone Number",
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
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: addressController,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Location",
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
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: houseNoController,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "House No",
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
                                Icons.house,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: addressController,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Address",
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
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: landmarkController,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "LandMark",
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
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: pincodeController,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Pincode",
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
                                Icons.post_add_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: SizedBox(
                            width: 150,
                            height: 60,
                            child: TextButton(
                              onHover: (value) {},
                              onPressed: (() => {sendAddress()}),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(color: Colors.red))),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(240, 190, 52, 10)),
                              ),
                            ),
                          ))
                        ])))));
  }

  sendAddress() {
    if (_key.currentState!.validate()) {
      // No any error in validation
      _key.currentState!.save();
    } else {
      // validation error
      setState(() {
        _validate = true;
        addAddress(
            "",
            "",
            "",
            nameController.text,
            addressController.text,
            houseNoController.text,
            mobileController.text,
            pincodeController.text,
            landmarkController.text,
            "",
            "");
      });
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 8,
                child: Container(
                  height: 100,
                  width: 250,
                  child: Center(
                    child: Text(
                      "Data Inserted Sucessfully",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ));
          });
    }
  }
}
