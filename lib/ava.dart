import 'package:flutter/material.dart';
import 'package:assistea/bubble.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class Ava extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    _AvaState ava = _AvaState();
    ava.Response("introductory message");
    return ava
    ;
  }


}

class _AvaState extends State<Ava> {
  final TextEditingController _chatController = new TextEditingController();
  final List<Bubble> _messages = <Bubble>[];



  void _handleSubmit(String text) {
    _chatController.clear();
    Bubble message = new Bubble(
        message: text,
        time: '12.00',
        delivered: true,
        isMe: false,
    );

    setState(() {
      _messages.insert(0, message);

    });

    Response(text);

  }

  void Response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/small_api_creds.json").build();
    print(authGoogle.sessionId + "sesion id wtf");
    Dialogflow dialogflow =Dialogflow(authGoogle: authGoogle,language: Language.SPANISH);

    AIResponse response = await dialogflow.detectIntent(query);
    Bubble message = new Bubble(
        message: "...",
        isMe: true,
        delivered: true,
        time: '12.00'
    );
    setState(() {
      _messages.insert(0, message);
    });

    Future.delayed(const Duration(milliseconds: 2000), () {

      Bubble message = new Bubble(
          message: response.getMessage() ?? "Ahora mismo no puedo comunicarme :(",
          isMe: true,
          delivered: true,
          time: '12.00'
      );

      setState(() {
        _messages.removeRange(0,1);
        _messages.insert(0, message);
      });

    });





  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Color(0x0DD0FF),
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

              new Flexible(
                child: ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),

              new Divider(
                height: 1.0,
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
                IconTheme(
                data: new IconThemeData(color: Colors.blue),
                child: new Container(
                margin: const EdgeInsets.symmetric(horizontal:8.0),

                             child: Column(
                               children: <Widget>[
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[

                                     ActionChip(backgroundColor: Colors.blue[50], label: Text("😄 Bien"), onPressed: () => _handleSubmit("Bien")),
                                     ActionChip(backgroundColor: Colors.green[50], label: Text("👍 Si"), onPressed: () => _handleSubmit("Si")),
                                     ActionChip(backgroundColor: Colors.grey[200], label: Text("😥 Mal"), onPressed: () => _handleSubmit("Mal")),
                                     ActionChip(backgroundColor: Colors.red[50], label: Text("😰 Ayuda"), onPressed: () => _handleSubmit("Ayuda")),



                                   ],
                                 ),

                                 new Divider(
                                   height: 1.0,
                                 ),


                                 new Row(
                            children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: new InputDecoration.collapsed(hintText: "Habla con AVA ..."),
                                      controller: _chatController,
                                      onSubmitted: _handleSubmit,
                                    ),
                                  ),
                                  new Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: new IconButton(
                                      icon: new Icon(Icons.send),
                                      color: Colors.blue[200],

                                      onPressed: ()=> _handleSubmit(_chatController.text),

                                    ),
                                  )
                            ],
                          ),
                               ],
                             ),
                  ),
                ),
              ),
          ],
        )
    );
  }
}

