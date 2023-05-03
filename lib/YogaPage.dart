
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nivarsha_v1/LoginScreen.dart';
import 'package:nivarsha_v1/YogaPageDetails.dart';

import 'MainPage.dart';

class YogaPage extends StatelessWidget {
  @override
  int size=8;
  int token=1;
  var asanaName=YogaPageDetails.yogaName;
  var asanaURL=YogaPageDetails.yogaURL;

  final database1=FirebaseDatabase.instance.ref('Yoga/vat/');
  Widget build(BuildContext context) {
    Future<String> getImageURL () async
    {

      final snapshot = await database1.get();
      Object? url = snapshot
          .child(YogaPageDetails.index.toString()).child("url").value;
      return url.toString();
    }
    Future<String> getImageName() async
    {
      final snapshot = await database1.get();
      Object? name = snapshot
          .child(YogaPageDetails.index.toString()).child("name").value;
      return name.toString();
    }

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=> MainPage()));},
                            color: Color(0xff212435),
                            iconSize: 24,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(80, 20, 0, 0),
                          child: Text(
                            "Yoga",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0x1f000000),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.zero,

                    ),
                    child:

                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    Image(
                      image: NetworkImage(asanaURL),
                      height: 150,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      asanaName,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff8a21b7),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
                    child: Align(
                      alignment: Alignment(0.6, 0.0),
                      child: MaterialButton(
                        onPressed: () async{

                          if(YogaPageDetails.index<size)
                            {
                             YogaPageDetails.index++;
                             YogaPageDetails.yogaURL=await getImageURL();
                             YogaPageDetails.yogaName=await getImageName();
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> YogaPage()));
                            }
                          else{
                            YogaPageDetails.index=0;
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> MainPage()));
                          }

                        },
                        color: Color(0xffa126bf),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          side: BorderSide(color: Color(0xffffffff), width: 0),
                        ),
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: Color(0xffffffff),
                        height: 40,
                        minWidth: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
