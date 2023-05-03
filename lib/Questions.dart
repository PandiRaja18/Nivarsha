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
import 'package:nivarsha_v1/MainPage.dart';
import 'package:nivarsha_v1/YogaPageDetails.dart';


class Questions extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title : 'Flutter Pred Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: QuestionsPage()
    );
  }

}
class QuestionsPage extends StatefulWidget
{
  @override
  _QuestionPage createState() => _QuestionPage();
}
class _QuestionPage extends State<QuestionsPage> {

  late bool _loading;
  int totalQuestions=19;
  int currentQs=1;
  final database1=FirebaseDatabase.instance.ref('Register/'+YogaPageDetails.user_id.toString());

  var question;
  var option_a;
  var option_b;
  var option_c;
  var dosha;

  int option_a_count=0;
  int option_b_count=0;
  int option_c_count=0;

  Map<int,String> Questions={ 1: "What is your body weight?",
                              2: "How does your skin look like?",
                              3: "How does your hair look like?",
                              4: "What do your teeth look like?",
                              5: "What do your eyes look like?",
                              6: "How do your nails look like?",
                              7: "What do your Lips look like?",
                              8: "How is your Appetite?",
                              9: "How is your Digestion?",
                             10: "Taste, healthy preference?",
                             11: "How much do you consume water?",
                             12: "Your Physical activity",
                             13: "Your Mental activity",
                             14: "Tell me about your emotions",
                             15: "Tell me about your Faith",
                             16: "Tell me about your Intellect",
                             17: "Your dreams",
                             18: "Your sleep",
                             19: "Your speech",
  };
  Map<int,String> option_a_choices={
    1 : "Low",
    2 : "Thin, Dry, Cold, Rough",
    3 : "Dry Brown, Black, Knotted, Brittle, Thin",
    4 : "Protruding, Big roomy, Thin gums",
    5 : "Small, Sunken, Dry, Active, Black, Brown, Nervous",
    6 : "Dry, Rough, Brittle, Break easily",
    7 : "Dry, cracked, Black/ brown tinged",
    8 : "Irregular, Scanty",
    9 : "Irregular, forms gas",
    10 : "Sweet, Sour, Salty",
    11 : "Changeable",
    12 : "Hyperactive",
    13 : "Always active",
    14 : "Anxiety, Fear, Uncertainty, Flexible",
    15 : "Variable, Changeable",
    16 : "Quick but faulty response",
    17 : "Quick, Active, Many, Fearful",
    18 : "Scanty, Broken up, sleeplessness",
    19 : "Rapid, Unclear",
  };

  Map<int,String> option_b_choices={

    1 : "Medium",
    2 : "Smooth, Oily, Warm, Rosy",
    3 : "Straight, Oily, Blond, Gray, Red, Bald",
    4 : "Medium, Soft, Tender gums",
    5 : "Sharp, Bright, Gray, Green, Yellow/ red, Sensitive to light",
    6 : "Sharp, Flexible, Pink, Lustrous",
    7 : "Red, inflamed, yellowish",
    8 : "Strong, Unbearable",
    9 : "Quick causes burning",
    10 : "Sweet, Bitter, Astringent",
    11 : "Surplus",
    12 : "Moderate",
    13 : "Moderate",
    14 : "Anger, Hate, Jealousy, Determined",
    15 : "Intense, Extremist",
    16 : "Accurate response",
    17 : "Fiery, War, Violence",
    18 : "Little but sound",
    19 : "Sharp, Penetrating"
  };
  Map<int,String> option_c_choices={

    1 : "Overweight",
    2 : "Thick, Oily, Cool, White, Pale",
    3 : "Thick, Curly, Oily, Wavy, Luxuriant",
    4 : "Healthy, White, Strong gums",
    5 : "Big, Beautiful, Blue, Calm, Loving",
    6 : "Thick, Oily, Smooth, Polished",
    7 : "Smooth, Oily, Pale white",
    8 : "Slow but steady",
    9 : "Prolonged, Forms mucus",
    10 : "Bitter, Pungent, Astringent",
    11 : "Sparse",
    12 : "Sedentary",
    13 : "Dull, Slow",
    14 : "Calm, Greedy, Attachment",
    15 : "Consistent, Deep, Mellow",
    16 : "Slow, Exact",
    17 : "Lakes, Snow, Romantic",
    18 : "Deep, Prolonged",
    19 : "Slow, monotonous"
  };


  void initState()
  {
    super.initState();
    question=Questions[currentQs];
    option_a=option_a_choices[currentQs];
    option_b=option_b_choices[currentQs];
    option_c=option_c_choices[currentQs];
    _loading = false;

  }
  setQuestion() {
      if(currentQs==totalQuestions)
      {
          if(option_a_count> option_b_count)
            {
              if(option_a_count>option_c_count)
                {
                  dosha="vat";
                }
            }
          else if(option_b_count>option_c_count)
            {
              dosha="pitta";
            }
          else{
            dosha="kapha";
          }
          YogaPageDetails.dosha=dosha;
          Map<String, Object?> updates = {'dosha':dosha};
          database1.update(updates);
          Navigator.push(context,MaterialPageRoute(builder: (context)=> MainPage()));
      }
      else{
        currentQs++;
        question=Questions[currentQs];
        option_a=option_a_choices[currentQs];
        option_b=option_b_choices[currentQs];
        option_c=option_c_choices[currentQs];

      }
      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Text(
                      question.toString(),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: MaterialButton(
                  onPressed: () {
                    option_a_count++;
                    setQuestion();
                  },
                  color: Color(0xffffffff),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Color(0xffe28b26), width: 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    option_a.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xffe28b26),
                  height: 40,
                  minWidth: 140,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: MaterialButton(
                  onPressed: () {
                    option_b_count++;
                    setQuestion();

                  },
                  color: Color(0xffffffff),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Color(0xffe28b26), width: 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    option_b.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xffe28b26),
                  height: 40,
                  minWidth: 140,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  option_c_count++;
                  setQuestion();
                },
                color: Color(0xffffffff),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Color(0xffe28b26), width: 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  option_c.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                textColor: Color(0xffe28b26),
                height: 40,
                minWidth: 140,
              ),
            ],
          ),
        ),
      ),
    );
  }
  }


