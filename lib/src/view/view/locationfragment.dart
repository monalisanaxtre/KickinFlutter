import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/addressfragment.dart';

class LocationFragment extends StatefulWidget {
  LocationFragment({Key? key}) : super(key: key);

  @override
  State<LocationFragment> createState() => _LocationFragmentState();
}

class _LocationFragmentState extends State<LocationFragment> {
  String location = 'Null, Press Button';
  String Address = 'search';
  @override
  void initState() {
    super.initState();
    startFunc();
  }

  startFunc() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    GetAddressFromLatLong(position);
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          color: Colors.black,
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                "Saved Location",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ]),
            SizedBox(
              height: 30,
            ),
            Text(
              "Preferred Location",
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    height: 60,
                    color: Colors.grey,
                    width: 100,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 22,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Bhubaneswar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          width: 120,
                        ),
                        Icon(
                          Icons.more_vert,
                          size: 22,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blueGrey,
              height: 100,
              child: Text(
                '${Address}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Route route =
                MaterialPageRoute(builder: (context) => AddressFragment());
            Navigator.push(context, route);
          },
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
