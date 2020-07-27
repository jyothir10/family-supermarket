import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/bloc/RiceBloc.dart';
import 'package:familysupermarket/components/riceCard.dart';
import 'package:familysupermarket/models/rice.dart';

class RiceScreen extends StatefulWidget {
  @override
  _RiceScreenState createState() => _RiceScreenState();
}

class _RiceScreenState extends State<RiceScreen> {
  final RiceBloc _riceBloc = RiceBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _riceBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        child: StreamBuilder<List<Rice>>(
          stream: _riceBloc.riceListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Rice>> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return RiceCard(
                        rice: snapshot.data[index],
                        cancelAdd: () {
                          setState(() {
                            snapshot.data[index].pressed = false;
                          });
                        },
                        addTap: () {
                          setState(() {
                            snapshot.data[index].pressed = true;
                          });
                        },
                        plus: () {
                          setState(() {
                            snapshot.data[index].qty++;
                          });
                        },
                        minus: () {
                          setState(() {
                            if (snapshot.data[index].qty > 0) {
                              snapshot.data[index].qty--;
                            }
                          });
                        },
                        popup: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext bc) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                height: 300,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Available Quantities",
                                            style: TextStyle(
                                              color: Color(0xFF464646),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Color(0xFFC4C4C4),
                                      thickness: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "1 kg",
                                            style: TextStyle(
                                              color: Color(0xFF464646),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                            ),
                                          ),
                                          Text(
                                            "₹ 32",
                                            style: TextStyle(
                                              color: Color(0xFF464646),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Color(0xFFC4C4C4),
                                      thickness: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "2 kg",
                                            style: TextStyle(
                                              color: Color(0xFF464646),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                            ),
                                          ),
                                          Text(
                                            "₹ 60",
                                            style: TextStyle(
                                              color: Color(0xFF464646),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Color(0xFFC4C4C4),
                                      thickness: 3,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
