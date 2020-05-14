import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NGOMap extends StatefulWidget {
  @override
  _NGOMapState createState() => _NGOMapState();
}

class _NGOMapState extends State<NGOMap> {

  Completer<GoogleMapController> _controller = Completer();
  double lat,lang; 

  _Loc() async {
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high) ;
  String val = position.toString();
  List<String> ans = val.split(", ");
  lat =  ans[0].split(": ")[1] as double;
  lang =  ans[1].split(": ")[1] as double;

  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Loc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft), onPressed: (){},),
      title: Text("Food Map"),
       ),
    body: Stack(
      children: <Widget>[
        _googlemap(context),
        _buildContainer()
      ],
    ),     
    );
  }

Widget _buildContainer() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 100.0,
      child: Card(
        child: SizedBox(width: 320.0,child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.fastfood),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("101, Sector A, Rajiv Chowk", style: TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                Padding(padding: EdgeInsets.all(5.0),),
            Text("New Delhi 110011", style: TextStyle(fontSize: 18.0,color: Colors.redAccent,))
              ],
            )

          ],
        )),
        elevation: 10.0,
      ),
    ),
  );
}




Widget _googlemap(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(target:LatLng(28.6330,77.2194),zoom: 12),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {newDelhi1,newDelhi2}
    ),
  );
}


Marker newDelhi1 = Marker(
  markerId: MarkerId("Delhi"),
  position: LatLng(28.6330,77.2194),
  infoWindow: InfoWindow(title : "Rajiv Chowk"),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed
  )
);
Marker newDelhi2 = Marker(
  markerId: MarkerId("Delhii"),
  position: LatLng(28.6233, 77.2145),
  infoWindow: InfoWindow(title : "Not Rajiv Chowk"),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet
  )
);

}
