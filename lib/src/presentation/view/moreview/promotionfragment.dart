import 'package:flutter/material.dart';
import 'package:kickinn/servicewrapper/getpromotion.dart';
import 'package:kickinn/src/data/promooffermodel.dart';

class PromotionFragment extends StatefulWidget {
  PromotionFragment({Key? key}) : super(key: key);

  @override
  State<PromotionFragment> createState() => _PromotionFragmentState();
}

class _PromotionFragmentState extends State<PromotionFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            color: Colors.black,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 100,
                ),
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
                  width: 80,
                ),
                Text(
                  "Promotion Offers",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ]),
              getAllOffer()
            ])));
  }
}

class getAllOffer extends StatefulWidget {
  getAllOffer({Key? key}) : super(key: key);

  @override
  State<getAllOffer> createState() => _getAllOfferState();
}

class _getAllOfferState extends State<getAllOffer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.1;
    final double itemWidth = size.width / 2;
    return Expanded(
        child: FutureBuilder<PromoOffer>(
            // future: getMenuCategoryList("1", "23"),
            future: getPromoOffer(),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(9, 4, 9, 0),
                              child: Container(
                                  color: Color.fromARGB(250, 85, 84, 84),
                                  child: InkWell(
                                      child: Column(children: <Widget>[
                                        AspectRatio(
                                          aspectRatio: 4.0 / 3.0,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Container(
                                                  height: 30,
                                                  child: Image(
                                                    image: NetworkImage(snapshot
                                                        .data!
                                                        .data[index]
                                                        .featureImage),
                                                  )),
                                              Text(
                                                  snapshot
                                                      .data!.data[index].name
                                                      .toUpperCase(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  snapshot.data!.data[index]
                                                      .offerDescription
                                                      .toUpperCase(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(
                                                  "startDate:${snapshot.data!.data[index].startDate}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                              Text(
                                                  "end Date${snapshot.data!.data[index].endDate}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            ],
                                          ),
                                          // Text(snapshot.data!.data[index].offerDescription.t)
                                        ),
                                        SizedBox(height: 3),
                                      ]),
                                      onTap: () {}))));
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
