/****
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watson_assistant_v2/watson_assistant_v2.dart';

class Chatbot extends StatelessWidget{
  @override
  WatsonAssistantV2Credential credential = WatsonAssistantV2Credential(
    version: '2019-02-28',
    username: 'apikey',
    apikey: '4sN2_zS_f295B3pZPE2TowrPt_yNLt6_6yMiUgAaG8Oe',
    assistantID: '043e1807-58b5-483b-bc59-e7697b8676a3',
    url: 'https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/31d8a3cd-2519-4e2e-a643-daad4292ddab/v2',
  );
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title : 'Flutter Pred Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: chatPage()
    );
  }

}
class chatPage extends StatefulWidget
{
  @override
  _chatPage createState() => _chatPage();
}
class _chatPage extends State<chatPage> {
  String? _text;
  final Uri url=Uri.parse("https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/31d8a3cd-2519-4e2e-a643-daad4292ddab");
  WatsonAssistantV2Credential credential =WatsonAssistantV2Credential(
      apikey: '4sN2_zS_f295B3pZPE2TowrPt_yNLt6_6yMiUgAaG8Oe',
      url: "https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/31d8a3cd-2519-4e2e-a643-daad4292ddab",
      assistantID: "043e1807-58b5-483b-bc59-e7697b8676a3");

  late WatsonAssistantApiV2 watsonAssistant;
  late WatsonAssistantResponse watsonAssistantResponse;
  WatsonAssistantContext watsonAssistantContext =
  WatsonAssistantContext(context: {});

  final myController = TextEditingController();

  void _callWatsonAssistant() async {
    watsonAssistantResponse = await watsonAssistant.sendMessage(
        myController.text, watsonAssistantContext);
    setState(() {
      _text = watsonAssistantResponse.resultText;
    });
    watsonAssistantContext = watsonAssistantResponse.context;
    myController.clear();
  }

  @override
  void initState() {
    super.initState();
    watsonAssistant =
        WatsonAssistantApiV2(watsonAssistantCredential: credential);
    _callWatsonAssistant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watson_Assistant_V2'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.restore,
            ),
            onPressed: () {
              watsonAssistantContext.resetContext();
              setState(() {
                _text = null;
              });
            },
          )
        ],
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'Your Input to the chatbot',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                _text != null ? '$_text' : 'Watson Response Here',

              ),
              SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _callWatsonAssistant,
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}


*****/