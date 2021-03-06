import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:familysupermarket/models/cart.dart';

class CartCard extends StatelessWidget {
  final Cart cart;
  final Function popup;
  final Function plus;
  final Function minus;

  CartCard({this.cart, this.popup, this.plus, this.minus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shadowColor: Color(0xFF740F53),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: cart.image,
                    height: 70,
                    width: 70,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        cart.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: popup,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        color: Color(0XFFE9E9E9),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text("1 Kg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFF5A5A5A),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: minus,
                                child: Container(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  color: Color(0xFF740F53),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                cart.qty.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: plus,
                                child: Container(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  color: Color(0xFF740F53),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        cart.rate,
                        style: TextStyle(
                          color: Color(0xFF464646),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 65),
                  child: Image(
                    image: AssetImage("images/close.png"),
                    height: 20,
                    width: 20,
                    alignment: Alignment.topRight,
                    color: Color(0xFF740F53),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
