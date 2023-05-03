import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nivarsha_v1/MainPage.dart';
import 'package:nivarsha_v1/Prediction.dart';
import 'package:nivarsha_v1/Questions.dart';
import 'package:nivarsha_v1/RegisterScreen.dart';
import 'package:nivarsha_v1/YogaPage.dart';

import 'Chatbot.dart';
import 'DietChart.dart';
import 'LoginScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDvCOf_45NER_0rml1xZD_54brJxXfW-Mo",
      appId: "1:31219946448:android:f1de64781d2177415d9fd5",
      messagingSenderId: "31219946448",
      projectId: "nivarsha-diet-recommendation",
      databaseURL: "https://nivarsha-diet-recommendation-default-rtdb.firebaseio.com/",
      storageBucket: "gs://nivarsha-diet-recommendation.appspot.com"
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:LoginScreen(),
    );
  }
}