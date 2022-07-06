import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/menudetail.dart';
import 'package:kickinn/src/data/menudetailmodel.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/menucategoryfragment.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/pickuporder.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/storeview.dart';
import 'package:kickinn/src/presentation/view/login.dart';

class MenuDetail extends StatefulWidget {
  MenuDetail({Key? key}) : super(key: key);

  @override
  State<MenuDetail> createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  MenuDeatilModel? menuSingleDetails;

  @override
  void initState() {
    super.initState();

    getMenuDetails(MenuCategory.storeMenuId, StoreFragment.storeId, LoginScreen.userId)
        .then((menuDetails) {
      setState(() {
        // menuDetails = menuDetails;
        menuSingleDetails = menuDetails;
        print("pp");
        print(menuDetails.data);
        print(menuDetails.data.runtimeType);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("ppppp");
    int _itemCount = 0;
    return Scaffold(
        backgroundColor: Colors.black,
        body: menuSingleDetails == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              width: 200,
                            ),
                            IconButton(
                              alignment: Alignment.topRight,
                              icon: Icon(Icons.shopping_cart_checkout_rounded),
                              iconSize: 28.0,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PickupOrder()));
                              },
                            ),
                          ]),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: Color.fromARGB(255, 128, 125, 125)),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Image.network(menuSingleDetails!.data.image),
                        height: 180,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        menuSingleDetails!.data.itemName,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Cooking Time -",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            menuSingleDetails!.data.cookingTime,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        menuSingleDetails!.data.itemQuantity,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  menuSingleDetails!.data.itemPrice,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                _itemCount != 0
                                    ? new IconButton(
                                        icon: new Icon(Icons.remove,
                                            color: Color.fromARGB(
                                                255, 247, 243, 243)),
                                        onPressed: () =>
                                            setState(() => _itemCount--),
                                      )
                                    : new Container(),
                                new Text(
                                  _itemCount.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                new IconButton(
                                    icon: new Icon(Icons.add,
                                        color:
                                            Color.fromARGB(255, 247, 243, 243)),
                                    onPressed: () =>
                                        setState(() => _itemCount++))
                              ],
                            )
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 2,
                        thickness: 2,
                        color: Colors.grey,
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
                            child: const Text('Add to Bag',
                                style: TextStyle(fontSize: 20)),
                            onPressed: () {},
                          ))),
                    ]))));
  }
}
