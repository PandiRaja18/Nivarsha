import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nivarsha_v1/DietChart.dart';
import 'package:nivarsha_v1/FoodCapture.dart';
import 'package:nivarsha_v1/LoginScreen.dart';
import 'package:nivarsha_v1/Prediction.dart';
import 'package:nivarsha_v1/ReportPage.dart';
import 'package:nivarsha_v1/YogaPage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;


class MainPage extends StatelessWidget {
  final _imagePicker = ImagePicker();
  late bool _loading;
  late XFile _image;
  late List? _outputs;
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
body:Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:MediaQuery.of(context).size.height,
decoration: BoxDecoration(
color:Color(0x1fffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
border:Border.all(color:Color(0x4d9e9e9e),width:1),
),
child:
SizedBox(
height:MediaQuery.of(context).size.height,
width:MediaQuery.of(context).size.width,
child:
Stack(
alignment:Alignment.topLeft,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/Rectangle-4.png"),
height:MediaQuery.of(context).size.height * 0.22,
width:MediaQuery.of(context).size.width,
fit:BoxFit.cover,
),
Align(
alignment:Alignment(0.0, -0.7),
child:Container(
height:127,
width:127,
clipBehavior: Clip.antiAlias,
decoration: BoxDecoration(
shape: BoxShape.circle,
),
child:Image.asset(
 "images/white.png",
fit:BoxFit.cover),
),
),
Align(
alignment:Alignment(0.0, -0.7),
child:Container(
height:120,
width:120,
clipBehavior: Clip.antiAlias,
decoration: BoxDecoration(
shape: BoxShape.circle,
),
child:Image.asset(
 "images/cat.jpg",
fit:BoxFit.cover),
),
),
Align(
alignment:Alignment(0.0, -0.3),
child:Text(
"Miichan",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
Align(
alignment:Alignment(-0.7, 0.0),
child:Text(
"Calories",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),

Align(
alignment:Alignment(0.8, -0.1),
child:Container(
height:70,
width:70,
clipBehavior: Clip.antiAlias,
decoration: BoxDecoration(
shape: BoxShape.circle,
),

),
),

  GestureDetector(onTap: (){
    print(LoginScreen.index);
    Navigator.push(context,MaterialPageRoute(builder: (context)=> YogaPage()));
  },
    child:
    Align(
    alignment:Alignment(-0.67, 0.3),
    child:///***If you have exported images you must have to copy those images in assets/images directory.
    Image(
    image:AssetImage("assets/images/image-2.png"),
    height:80,
    width:80,
    fit:BoxFit.contain,
    ),
    ),
  ),
GestureDetector(onTap: () async{
  Navigator.push(context,MaterialPageRoute(builder: (context)=> Prediction()));
},
  child:
  Align(
    alignment:Alignment(0.0, 0.3),
    child:///***If you have exported images you must have to copy those images in assets/images directory.
    Image(
      image:AssetImage("assets/images/Rectangle-6.png"),
      height:80,
      width:80,
      fit:BoxFit.cover,
    ),
  )
),
  GestureDetector(onTap: (){
    print(LoginScreen.index);
    Navigator.push(context,MaterialPageRoute(builder: (context)=> DietChart()));
  },
    child:
    Align(
    alignment:Alignment(0.75, 0.3),
    child:///***If you have exported images you must have to copy those images in assets/images directory.
    Image(
    image:AssetImage("assets/images/diet2.png"),
    height:70,
    width:50,
    fit:BoxFit.contain,
    ),
    ),
  ),

Align(
alignment:Alignment(-0.6, 0.4),
child:Text(
"Yoga",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
),
Align(
alignment:Alignment(0.0, 0.4),
child:Text(
"Food Capture",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
),
Align(
alignment:Alignment(0.7, 0.4),
child:Text(
"Diet",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
),
Align(
alignment:Alignment(-0.5, 0.7),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/image-5.png"),
height:70,
width:70,
fit:BoxFit.contain,
),
),
  GestureDetector(onTap: (){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> ReportPage()));
  },child:
  Align(
  alignment:Alignment(0.5, 0.7),
  child:///***If you have exported images you must have to copy those images in assets/images directory.
  Image(
  image:AssetImage("assets/images/image-3.png"),
  height:60,
  width:65,
  fit:BoxFit.contain,
  ),
  ),
  ),
Align(
alignment:Alignment(-0.5, 0.8),
child:Text(
"Milestones",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
),
Align(
alignment:Alignment(0.5, 0.8),
child:Text(
"Report",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
),
Align(
alignment:Alignment(0.9, -1.0),
child:ImageIcon(
AssetImage("images/Navigation-Icon.png"),
size:20,
color:Color(0xffffffff),
),
),
],),),
),
)
;}
}