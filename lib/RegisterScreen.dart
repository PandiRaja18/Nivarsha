
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nivarsha_v1/LoginScreen.dart';
import 'package:nivarsha_v1/YogaPageDetails.dart';

import 'Questions.dart';


class RegisterScreen extends StatelessWidget {
final database=FirebaseDatabase.instance.ref();

TextEditingController _username=new TextEditingController();
TextEditingController _emailid=new TextEditingController();
TextEditingController _password=new TextEditingController();
TextEditingController _confirmpassword=new TextEditingController();
@override
Widget build(BuildContext context) {
  final formGlobalKey = GlobalKey<FormState>();
return Scaffold(
backgroundColor: Color(0xffffffff),
body:Form(
  key : formGlobalKey,
  child : Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:MediaQuery.of(context).size.height,
decoration: BoxDecoration(
color:Color(0x00ffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
border:Border.all(color:Color(0x4d9e9e9e),width:1),
),
child:
Align(
alignment:Alignment(-0.7, 0.0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Align(
alignment:Alignment(-0.85, 0.0),
child:Text(
"Register",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w800,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
),
Align(
alignment:Alignment(-0.7, 0.0),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/StraightLine.png"),
height:20,
width:45,
fit:BoxFit.contain,
),
),
Align(
alignment:Alignment(-0.85, 0.0),
child:Text(
"Name",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(30, 5, 30, 0),
child:TextFormField(
controller:_username,
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
hintText:"Full name",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff9f9c9c),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 5,horizontal:12),
),
  validator : (name) {
    if (name != null) {
        return null;
    } else {
      return 'Enter Full Name';
    }
  },
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
child:Align(
alignment:Alignment(-0.8, 0.0),
child:Text(
"Email id",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(30, 5, 30, 0),
child:TextFormField(
controller:_emailid,
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
hintText:"E-mail id",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff9f9c9c),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
  validator : (email) {
    if (email != null) {
      final RegExp regex =
      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regex.hasMatch(email!))
        return 'Enter a valid email';
      else
        return null;
    } else {
      return 'Enter a valid email';
    }
  },
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
child:Align(
alignment:Alignment(-0.8, 0.0),
child:Text(
"Password",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(30, 5, 30, 0),
child:TextFormField(
controller:_password,
obscureText:true,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
hintText:"Password",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff9f9c9c),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
), validator:(password) {
  if(password!=null && password.length>8)
    {
      return null;
    }
  else{
    return 'Password should be 8 characters long';
  }
},
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
child:Align(
alignment:Alignment(-0.7, 0.0),
child:Text(
"Confirm Password",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff000000),
),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(30, 5, 30, 0),
child:TextFormField(
controller:_confirmpassword,
obscureText:true,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(6.0),
borderSide:BorderSide(
color:Color(0xff000000),
width:2
),
),
hintText:"Confirm Password",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff9f9c9c),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
validator : (confirmPassword){
  if(confirmPassword!=null && confirmPassword==_password.text)
    {
      return null;
    }
  else{
    return 'Use same password';
  }
},
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 20, 0, 0),
child:MaterialButton(
onPressed:()async{
  final database1=FirebaseDatabase.instance.ref('token');
  final database2=FirebaseDatabase.instance.ref('Register');
  final database3=FirebaseDatabase.instance.ref('Login');
  final snapshot = await database1.get();
  Object? data=snapshot.value;
  if (formGlobalKey.currentState!.validate()) {
    formGlobalKey.currentState?.save();
    // use the email provided here
    database2.child(data.toString()+'/').set({'name':_username.text,'email':_emailid.text,'password':_password.text});
    database3.child(data.toString()+'/').set({'email':_emailid.text,'password':_password.text});
    print("Record Inserted");
    YogaPageDetails.user_id=int.parse(data.toString());
    YogaPageDetails.user_name=_username.text;
    int data1=int.parse(data.toString())+1;
    Map<String, Object?> updates = {'token':data1.toString()};
    database.update(updates);
    Navigator.push(context,MaterialPageRoute(builder: (context)=> Questions()));
  }
  /*database.child(_username.text+'/').set({'name':_username.text,'email':_emailid.text,'password':_password.text}).catchError((Error) => print("You Got an Error ! $Error"));
  print("Record Inserted");
  Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreen()));*/
  /*FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailid.text, password: _password.text).then((value){
    print("Created New Account");
    Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreen()));
  }).onError((error, stackTrace){
    print("Error ${error.toString()}");
  });*/
},
color:Color(0xff8420d3),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(8.0),
),
padding:EdgeInsets.symmetric(vertical: 18,horizontal:16),
child:Text("Register", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:22,
minWidth:100,
),
),
  Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreen()));
        },
          child: const Text("Already a Member?"),)
      ],

    ),

  ),
],),),
),
)
)
;}
}

