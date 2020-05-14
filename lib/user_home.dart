import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sharemymeal/main.dart';
import 'package:sharemymeal/signup.dart';
import 'package:sharemymeal/user_food.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class UserHomePage extends StatefulWidget {
  final Function callback;
  final String user_phone;
  UserHomePage(this.callback, this.user_phone);
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  String _name = "";
  // String lat, lang;

  // _Loc() async {
  //   Position position = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   String val = position.toString();
  //   List<String> ans = val.split(", ");
  //   lat = ans[0].split(": ")[1];
  //   lang = ans[1].split(": ")[1];
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _Loc();
    ref
        .child("user")
        .orderByChild("mobile")
        .equalTo(widget.user_phone)
        .once()
        .then((DataSnapshot data) {
      var val = data.value;
      for (var key in val) {
        print(_name);
        _name = key['name'];
      }

      setState(() {});
    });
  }

  final List<String> title = <String>[
    'NGO-1',
    'NGO-2',
    'NGO-3',
    'NGO-1',
    'NGO-2',
    'NGO-3',
  ];

  final List<String> image = <String>[
    'assets/resturant-1-sushi-den.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new ListTile(
                leading: Icon(Icons.add),
                title: new Text("Add Item"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Userfood()),
                  );
                }),
            new Divider(),
            new ListTile(
              leading: Icon(Icons.verified_user),
              title: new Text("Profile"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
            )
          ],
        ),
      ),
      body: Wrap(
        children: <Widget>[
          Container(
            height: 380,
            decoration: BoxDecoration(
              color: Color(0XFF00B1FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.lightBlue,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 36, right: 36),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset('assets/menu-1-yoshimasa-sushi.png'),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                _name,
                                style: TextStyle(
                                  fontFamily: 'Montserrat-SemiBold',
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: <Widget>[
                              SmoothStarRating(
                                allowHalfRating: false,
                                starCount: 5,
                                rating: 5,
                                size: 15.0,
                                color: Colors.white,
                                borderColor: Colors.white,
                                spacing: 0.0,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "250+ Meal Shared",
                                style: TextStyle(
                                  fontFamily: 'Montserrat-SemiBold',
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 30,
                                child: Text(
                                  "Thanks for supporting! You earned a superhero batch!",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat-Medium',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icon-favorite.png',
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Past-Supplies",
                  style: TextStyle(
                    fontFamily: 'Montserrat-Bold',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF2A2A2A),
                  ),
                ),
                Container(
                  width: 124,
                  height: 1,
                  margin: EdgeInsets.only(top: 16),
                  color: Color(0XFF707070),
                )
              ],
            ),
          ),

          //LIST

          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'NGO-1',
                              style: TextStyle(
                                fontFamily: 'Montserrat-Bold',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2A2A2A),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: SmoothStarRating(
                                allowHalfRating: false,
                                starCount: 5,
                                rating: 5,
                                size: 12.0,
                                color: Color(0XFFFFA127),
                                spacing: 0.0,
                              ),
                            ),
                            Container(
                              width: 130,
                              height: 25,
                              child: Text(
                                "You've helped a needy one.",
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Medium',
                                  fontSize: 12,
                                  color: Color(0XFFA29F9F),
                                ),
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          padding: EdgeInsets.all(0.0),
                          child: Container(
                            width: 88,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0XFF00D99E),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    offset: Offset(0, 15),
                                    color: Color(0XFF00D99E).withOpacity(.6),
                                    spreadRadius: -9,
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Credit Earned.",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'NGO-2',
                              style: TextStyle(
                                fontFamily: 'Montserrat-Bold',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2A2A2A),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: SmoothStarRating(
                                allowHalfRating: false,
                                starCount: 5,
                                rating: 5,
                                size: 12.0,
                                color: Color(0XFFFFA127),
                                spacing: 0.0,
                              ),
                            ),
                            Container(
                              width: 130,
                              height: 25,
                              child: Text(
                                "You've helped a needy one.",
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Medium',
                                  fontSize: 12,
                                  color: Color(0XFFA29F9F),
                                ),
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          padding: EdgeInsets.all(0.0),
                          child: Container(
                            width: 88,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0XFF00D99E),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    offset: Offset(0, 15),
                                    color: Color(0XFF00D99E).withOpacity(.6),
                                    spreadRadius: -9,
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Credit Earned.",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'NGO-3',
                              style: TextStyle(
                                fontFamily: 'Montserrat-Bold',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2A2A2A),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: SmoothStarRating(
                                allowHalfRating: false,
                                starCount: 5,
                                rating: 5,
                                size: 12.0,
                                color: Color(0XFFFFA127),
                                spacing: 0.0,
                              ),
                            ),
                            Container(
                              width: 130,
                              height: 25,
                              child: Text(
                                "You've helped a needy one.",
                                style: TextStyle(
                                  fontFamily: 'Montserrat-Medium',
                                  fontSize: 12,
                                  color: Color(0XFFA29F9F),
                                ),
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          padding: EdgeInsets.all(0.0),
                          child: Container(
                            width: 88,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0XFF00D99E),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    offset: Offset(0, 15),
                                    color: Color(0XFF00D99E).withOpacity(.6),
                                    spreadRadius: -9,
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Credit Earned.",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
