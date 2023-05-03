import 'dart:convert';
import 'dart:io';

import 'package:cross_file_image/cross_file_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:cross_file_image/cross_file_image.dart';


class Prediction extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title : 'Flutter Pred Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PredictionPage()
    );
  }

}
class PredictionPage extends StatefulWidget
{
  @override
  _PredictionPage createState() => _PredictionPage();
}
class _PredictionPage extends State<PredictionPage> {
  final database1=FirebaseDatabase.instance.ref('Dishes');
  final database2=FirebaseDatabase.instance.ref('Nutrition');
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  XFile? selectImage;
  String? message;
  late bool _loading;

  var ingredients;
  var calories;
  var calcium;
  var iron;
  var protein;
  void initState()
  {
    super.initState();
    _loading = false;

  }
  uploadImage() async
  {
    final request = http.MultipartRequest("POST", Uri.parse(
        "https://4d56-2400-65c0-c-32a-214f-2c03-2fb0-5cf1.in.ngrok.io/upload"));
    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile(
        'image', selectedImage!.readAsBytes().asStream(),
        selectedImage!.lengthSync(), filename: selectedImage!
        .path
        .split("/")
        .last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['message'];

    print(message);

    final _dishesSnapshot = await database1.get();
    final _nutritionSnapshot = await database2.get();
    Object? ingredients_ = _dishesSnapshot
        .child(message.toString())
        .child("Ingredients")
        .value;
    ingredients=ingredients_.toString();

    Object? _calories = _nutritionSnapshot
        .child(message.toString())
        .child("Calories")
        .value;
    Object? _calcium = _nutritionSnapshot
        .child(message.toString())
        .child("Calcium")
        .value;
    Object? _iron = _nutritionSnapshot
        .child(message.toString())
        .child("Iron")
        .value;
    Object? _protein = _nutritionSnapshot
        .child(message.toString())
        .child("Protein")
        .value;

    calories=_calories.toString();
    calcium=_calcium.toString();
    iron=_iron.toString();
    protein=_protein.toString();
    setState(() {

    });
  }
  Future getImage() async
  {
    final pickedImage = await _picker.getImage(source: ImageSource.gallery);
    selectedImage = File(pickedImage!.path);
    //selectImage = pickedImage as XFile?;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        body:_loading ?Text("Not Loaded"): Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[SizedBox(
              height: 40,
            ),Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff000000),
                    size: 26,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(95, 0, 0, 0),
                    child: Text(
                      "Food Capture",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
              SizedBox(
                height: 20,
              ), selectedImage == null ?
              Text("Please pick an image to upload",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    background: Paint()
                      ..color = Colors.white,
                    fontWeight: FontWeight.bold),
              ) : Image.file(selectedImage!,width: 280,height: 250),
              SizedBox(
                height: 20,
              ),
              Text(message == null ? "": message.toString(),style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  background: Paint()
                    ..color = Colors.white,
                  fontWeight: FontWeight.bold)),

          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
                children: [
                  Text("Ingredients : ",style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,

                      fontWeight: FontWeight.bold)),
                  Text (ingredients==null ? "" : ingredients,style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,

                      fontWeight: FontWeight.normal)),

                ],
              ),
          ),

              Padding(
                padding: EdgeInsets.all(40),
              child: Column(
                children: [Row(
                  children: [
                    Text("Nutrition Details : ",style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        background: Paint()
                          ..color = Colors.white,
                        fontWeight: FontWeight.bold)),
                  ],
                ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Calories : ",style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          background: Paint()
                            ..color = Colors.white,
                          fontWeight: FontWeight.bold)),

                      Text((calories==null ? "" : calories)+" cal"),

                    ],

                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Calcium : ",style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          background: Paint()
                            ..color = Colors.white,
                          fontWeight: FontWeight.bold)),

                      Text((calcium==null ? "" : calcium)+" mg"),

                    ],

                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Iron : ",style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          background: Paint()
                            ..color = Colors.white,
                          fontWeight: FontWeight.bold)),

                      Text((iron==null ? "" : iron)+" mg"),

                    ],

                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Protein : ",style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          background: Paint()
                            ..color = Colors.white,
                          fontWeight: FontWeight.bold)),

                      Text((protein==null ? "" : protein)+" g"),

                    ],

                  ),

                ],
              ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(onPressed: uploadImage,color:Color(0xff8325d0),
                elevation:0,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(8.0),
                ),
                padding:EdgeInsets.all(16),
                child:Text("Predict", style: TextStyle( fontSize:14,
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                ),),
                textColor:Color(0xffffffff),
                height:36,
                minWidth:120,),
              /*TextButton.icon(onPressed: uploadImage,
                  icon: Icon(Icons.upload_file),
                  label: Text("Predict")),*/

            ],
          ),

        ),

        floatingActionButton: FloatingActionButton(
          onPressed: getImage, child: Icon(Icons.add_a_photo),)
    );
  }
}

