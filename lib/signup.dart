import 'package:flutter/material.dart';
import 'package:sharemymeal/login.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign UP',
      debugShowCheckedModeBanner: false,

      home: Signup(),
    );
  }
}


class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {



  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 50.0,

          title: Text("Share The Meal",
              style: TextStyle(
                color: Colors.white,
              )),),
        body: ListView
          (
          shrinkWrap: true, padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>
          [

            // Padding above create an account text
            Padding
              (
              padding:
              const EdgeInsets.symmetric( vertical: 10.0),
            ),

            // create an account text
            Padding(
              padding: const EdgeInsets.only(left:80.0,right :60.0),
              child: new Row(
                children: <Widget>
                [
                  Center(
                    child: Icon(
                      Icons.account_box,
                      color: Colors.green,
                      size: 30.0,
                    ),
                  ),
                  Center(child: Text("Share the Meal",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w800),)),


                ],

              ),
            ),

            Padding
              (
              padding:
              const EdgeInsets.symmetric( vertical: 10.0),
            ),
//Name
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText: 'Name'),
              ),
            ),
//Email
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText: 'Email'),
              ),
            ),

//Address
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText: 'Address'),
              ),
            ),

//City
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText: 'City'),
              ),
            ),
//PINCODE
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText: 'Pincode'),
              ),
            ),




            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                child: new Text("Save", style: TextStyle(color: Colors.white),),
                color: Colors.green,
                onPressed: (){

                },
              ),
            ),

            Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                WavyFooter(),
                CirclePink(),
                CircleYellow(),
              ],
            )
          ],
        )
    );
  }
}






const List<Color> orangeGradients = [
  Color(0xFFFF9844),
  Color(0xFFFE8853),
  Color(0xFFFD7267),
];

const List<Color> aquaGradients = [
  Color(0xFF5AEAF1),
  Color(0xFF8EF7DA),
];



class WavyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: aquaGradients,
              begin: Alignment.center,
              end: Alignment.bottomRight),
        ),
        height: MediaQuery.of(context).size.height / 5,
      ),
    );
  }
}

class CirclePink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-70.0, 90.0),
      child: Material(
        color: Colors.pink,
        child: Padding(padding: EdgeInsets.all(120)),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 10.0)),
      ),
    );
  }
}

class CircleYellow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, 210.0),
      child: Material(
        color: Colors.yellow,
        child: Padding(padding: EdgeInsets.all(140)),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 10.0)),
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
    Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height - 60);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class YellowCircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return null;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}