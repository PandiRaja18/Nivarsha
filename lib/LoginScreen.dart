
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nivarsha_v1/YogaPageDetails.dart';


import 'MainPage.dart';
import 'RegisterScreen.dart';


class LoginScreen extends StatelessWidget {
  final database1=FirebaseDatabase.instance.ref('token');
  final database2=FirebaseDatabase.instance.ref('Login');
  final database3=FirebaseDatabase.instance.ref('Register');
  final LoginformGlobalKey = GlobalKey<FormState>();
  late int size;
  static late int index=0;
  static int yogaIndex=1;
  late int status=0;
  late int passStatus=0;
  late Object? data2;


  getIndex(String email)async
  {
    final snapshot = await database2.get();
    final snapshot2= await database3.get();
      for(int i=1;i<size;i++) {
        //print('Here');
          Object? data = snapshot
            .child(i.toString())
            .child("email")
            .value;
        if (data == email) {
          status = 1;
          Object? data = snapshot2.child(i.toString()).child("dosha").value;
          YogaPageDetails.dosha=data.toString();

          index = i;
        }
      }
  }

  passCheck(String password)async{
    final snapshot = await database2.get();
    Object? data=snapshot.child(index.toString()).child("password").value;
    if(password == data.toString())
      {
        passStatus=1;
      }else{
      passStatus=0;
    }
  }

  getSize()
  async{
    final snapshot = await database1.get();
    Object? data=snapshot.value;
    size=int.parse(data.toString());
    //print(size);
  }

  TextEditingController _emailid=new TextEditingController();
  TextEditingController _password=new TextEditingController();
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
body:Form (
  key : LoginformGlobalKey,
  child:Container(
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
Align(
alignment:Alignment(-0.7, 0.0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Padding(
padding:EdgeInsets.fromLTRB(30, 0, 0, 0),
child:Text(
"Log in",
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
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 15),
child:Align(
alignment:Alignment(-0.8, 0.0),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/StraightLine.png"),
height:20,
width:40,
fit:BoxFit.contain,
),
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:30),
child:Align(
alignment:Alignment.center,
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
hintText:"E-mail id or user id",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 5,horizontal:12),
),
   validator : (email){

      getIndex(_emailid.text);
        if (status==1){
          return null;
        }
        else{
          print(status);
          return 'Invalid Email';
      }

    },
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(30, 15, 30, 0),
child:TextFormField (
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
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0xffffffff),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 5,horizontal:12),
),
 validator : (password){

    if(password==null )
    {
      return 'Enter Password';
    }
    else if(passStatus==1){
      return null;
    }
  else{
    print(passStatus);
    return 'Incorrect Password';
  }
},),
),
Container(
alignment:Alignment.centerRight,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:25,
decoration: BoxDecoration(
color:Color(0x1fffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
border:Border.all(color:Color(0x4dffffff),width:1),
),
/*child:
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 30, 0),
child:Text(
"Forgot password?",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff4f86db),
),
),
),*/
),
Container(
alignment:Alignment.center,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:90,
decoration: BoxDecoration(
color:Color(0x1fffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
border:Border.all(color:Color(0x4dffffff),width:1),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Padding(
padding:EdgeInsets.fromLTRB(0, 15, 0, 0),
child:MaterialButton(
onPressed:()async{
  await getSize();
  await getIndex(_emailid.text);
  await passCheck(_password.text);
  if (LoginformGlobalKey.currentState!.validate()) {
    LoginformGlobalKey.currentState?.save();

    Navigator.push(context,MaterialPageRoute(builder: (context)=> MainPage()));
  }
  /*
  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailid.text, password: _password.text).then((value) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
  });*/

},
color:Color(0xff8325d0),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(8.0),
),
padding:EdgeInsets.all(16),
child:Text("Log in", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:36,
minWidth:120,
),
),
],),
),
  Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> RegisterScreen()));
        },
          child: const Text("Don't have an account?"))
      ],

    ),

  ),
],),),
),),
)
;}
}