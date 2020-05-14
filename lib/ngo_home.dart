import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharemymeal/ngo_map.dart';


class Ngohome extends StatefulWidget {
  @override
  _NgohomeState createState() => _NgohomeState();
}

class _NgohomeState extends State<Ngohome> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: MyAppBar(),
              pinned: true,
              expandedHeight: 210.0,
              flexibleSpace: FlexibleSpaceBar(
                background: MyFlexiableAppBar(),
              ),
            ),
             SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[

                  myCardDetails(
                      "Chapati","Arpit", "Rajiv Chowk",context),
                  myCardDetails(
                      "Aalo Paratha","Rishi", "Rajiv Chowk",context),
                  myCardDetails(
                      "Vegetable","Bharat", "Rajiv Chowk",context),
                  

                ],
              ),
            ),
          ],
        )
    );
  }

}

Widget myCardDetails(String foodname, String ownername, String address,BuildContext context)
{
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: myCurrencies(
            foodname, ownername, address,context
        ),
      ),
    ),
  );
}

Center myCurrencies(String foodname, String ownername, String address, BuildContext context) {
  return Center(
      child: Column(
        children: <Widget>[
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              foodName(foodname),
              ownerName(ownername),
              myAddress(address),
              FlatButton(child: Icon(Icons.arrow_right),onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NGOMap()),
                );
              },
                        )
            ],)
        ],)
  );
}


Widget foodName(String foodname) {
  return Container(
      child: Row(children: <Widget>[
        SizedBox(width: 10.0,),
        Container(child: Text(
          foodname, style: TextStyle(
            color: Color(0xff3a2483),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 16.0
        ),),),
      ],)
  );
}


Widget ownerName(String ownername) {
  return Container(
      child: Row(children: <Widget>[
        SizedBox(width: 10.0,),
        Container(child: Text(
          ownername, style: TextStyle(
            color: Color(0xff3a2483),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 16.0
        ),),),
      ],)
  );
}


Widget myAddress(String address) {
  return Container(
      child: Row(children: <Widget>[
        SizedBox(width: 10.0,),
        Container(child: Text(
          address, style: TextStyle(
            color: Color(0xff3a2483),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 16.0
        ),),),
      ],)
  );
}



// My APP BAR



class MyAppBar extends StatelessWidget {

  final double barHeight = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              'Meals Served Till Date',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
              ),
            ),

          ),);
  }
}

// FLEXIBLE APP BaseTapGestureRecognizer



class MyFlexiableAppBar extends StatelessWidget {

  final double appBarHeight = 66.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   
                    Container(child: new Text(
                        "2420,91+",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            fontSize: 36.0
                        )
                    ),),
                    Container(child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: new Text(
                          "Millons more to serve",
                          style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Poppins',
                              fontSize: 20.0
                          )
                      ),
                    ),),
                  ],),),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    

                    Container(child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text("Available Meals!")
                    ),),

                  ],),
              ),


          
            ],)
      ),
      decoration: new BoxDecoration(
        color: Color(0xff013db7),
      ),
    );
  }
}

//

//