import 'package:familysupermarket/screens/supermarketscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class locationScreen extends StatefulWidget {
  static const String id = '/location';
  @override
  _locationScreenState createState() => _locationScreenState();
}

class _locationScreenState extends State<locationScreen> {
  String _dropDownValue = "Thalasseri branch";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xFF464646),
            size: 30,
          ),
        ),
        backgroundColor: Color(0xFFE9E9E9),
        title: Text(
          "NEAREST  BRANCH",
          style: TextStyle(
            fontSize: 22,
            color: Color(0xFF740F53),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ButtonTheme(
                minWidth: 175,
                child: RaisedButton(
                  color: Color(0xFF741053),
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, SupermarketScreen.id);
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "SET LOCATION",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(11.874477, 75.370369), zoom: 15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: DropdownButton<String>(
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF5A5A5A),
                      ),
                      elevation: 25,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF740F53),
                        size: 30,
                      ),
                      dropdownColor: Color(0xFFC4C4C4),
                      items: <String>[
                        "Thalasseri branch",
                        "Kannur branch",
                        "Thaliparamba branch",
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(_dropDownValue),
                      onChanged: (newVal) {
                        this.setState(() {
                          _dropDownValue = newVal;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
