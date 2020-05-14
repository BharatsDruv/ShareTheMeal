import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class UserfoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      debugShowCheckedModeBanner: false,

      home: Userfood(),
    );
  }
}


class Userfood extends StatefulWidget {
  @override
  _UserfoodState createState() => _UserfoodState();
}

class _UserfoodState extends State<Userfood> {


  String _item1= "";
  String _item2="";
  File _image;

  DatabaseReference ref = FirebaseDatabase.instance.reference();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;

    });
  }


_makePostRequest(String urll) async {
  // set up POST request arguments
  // String url = 'https://52.168.166.224:5000/';
  // String jsonn = '{"image": "$urll"}';
  // Map<String, String> headers = {"Content-type": "application/json"};
  // make POST request
  // print(jsonn);
  // Response response = await post(url, headers: headers,body: jsonn);
  // check the status code for the result
  // int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  // String body = response.body;
  // print(body);
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 101
  // }
  Response response;
  Dio dio = new Dio();
  response = await dio.post("http://52.168.166.224:5000/", data: {"image": urll});
  setState(() {
    _item1 = response.data['answer'][0];
    _item2 = response.data['answer'][1];
    
    _showDialog();
  });
  
}

void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Ingredients"),
          content: Row(
            children: <Widget>[
              new Text(_item1, style: TextStyle(fontSize: 20.0,color: Colors.blueAccent),),
              new Text(", ",style: TextStyle(color: Colors.blueAccent)),
              new Text(_item2, style: TextStyle(fontSize: 20.0,color: Colors.blueAccent),),
            ],
          ),
          
        );
      },
    );
  }
  Future _addFile() async {
    var dowurl = null;

    String url = "";
    StorageReference st_ref = FirebaseStorage.instance
        .ref()
        .child("Hello");
    StorageUploadTask task = st_ref.putFile(_image);

    setState(() {
      
    });


      dowurl = await (await task.onComplete).ref.getDownloadURL();
      url = dowurl.toString();
      //Type hard coded to pdf
      ref.child("food").child("image_url").push().set({"image_url":url});
      _makePostRequest(url);
      setState(() {

      });

  }


  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 50.0,

          title: Text("Food Form",
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

            //Add Form text
            Padding(
              padding: const EdgeInsets.only(left:80.0,right :60.0),
              child: new Row(
                children: <Widget>
                [
                  Icon(
                    Icons.fastfood,
                    color: Colors.lightBlue,
                    size: 30.0,
                  ),
                  Text("Add Food",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w800),),


                ],

              ),
            ),


//FoodName
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText: 'Food Name:'),
              ),
            ),
//Food Description
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText: 'Food Description'),
              ),
            ),
//Food Image
            Container(


                    child: new Column(
                        children: <Widget>
                    [

                   _image == null ? Text('No image selected.') : Image.file(_image),
                   FloatingActionButton(
                    onPressed: getImage,
                    tooltip: 'Pick Image',
                    child: Icon(Icons.add_a_photo),
                  ),
              ],
              ),
            ),




            Padding
              (
              padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: new Text
                (
                  "Address:"
                ),
                ),



//Building/street
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText:'Building/Street:'),
              ),
            ),
// City
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText:'City:'),
              ),
            ),
//Pincode
            Padding
              (
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField
                (
                decoration: new InputDecoration(labelText:'Pincode:'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                child: new Text("Add Food", style: TextStyle(color: Colors.white),),
                color: Colors.green,
                onPressed: (){
                    _addFile();
                },
              ),
            ),

          ],
        )
    );
  }
}