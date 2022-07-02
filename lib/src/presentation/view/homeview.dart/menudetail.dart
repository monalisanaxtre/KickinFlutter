import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/menudetail.dart';
import 'package:kickinn/src/data/menudetailmodel.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/menucategoryfragment.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/pickuporder.dart';
import 'package:kickinn/src/presentation/view/homeview.dart/storeview.dart';

class MenuDetail extends StatefulWidget {
  MenuDetail({Key? key}) : super(key: key);

  @override
  State<MenuDetail> createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  MenuDeatilModel? menuSingleDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMenuDetails(MenuCategory.storeMenuId, StoreFragment.storeId, "23")
        .then((menuDetails) {
      setState(() {
        menuDetails = menuDetails;
        print(menuDetails);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int _itemCount = 0;
    return Scaffold(
        backgroundColor: Colors.green,
        body: menuSingleDetails == null
            ? CircularProgressIndicator(
                color: Colors.red,
              )
            : Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              onPressed: () {},
                            ),
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
                      child: Image.asset('assets/f.jpg'),
                      height: 200,
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
                                      icon: new Icon(Icons.remove),
                                      onPressed: () =>
                                          setState(() => _itemCount--),
                                    )
                                  : new Container(),
                              new Text(_itemCount.toString()),
                              new IconButton(
                                  icon: new Icon(Icons.add),
                                  onPressed: () => setState(() => _itemCount++))
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     Image.asset('assets/minus.png'),
                              //     SizedBox(
                              //       width: 5,
                              //     ),
                              //     Text(
                              //       "1",
                              //       style: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: 18,
                              //           fontWeight: FontWeight.normal),
                              //     ),
                              //     SizedBox(
                              //       width: 5,
                              //     ),
                              //     Image.asset("assets/plus.png")
                              //   ],
                              // )
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
                            child: FlatButton(
                          textColor: Colors.white,
                          child: const Text('Add to Bag',
                              style: TextStyle(fontSize: 20)),
                          onPressed: () {},
                        ))),
                  ])));
  }
}
