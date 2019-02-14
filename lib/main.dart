import 'package:flutter/material.dart';
import 'package:assistea/ava.dart';
import 'package:assistea/agenda.dart';




void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AssisTEA',
        theme: ThemeData(
          // Define the default Brightness and Colors
          brightness: Brightness.light,
          primaryColor: Colors.lightGreen[400],
          accentColor: Colors.lightGreen[700],

          // Define the default Font Family
          fontFamily: 'Montserrat',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.lightGreen[900]),
            title: TextStyle(fontSize: 24.0, color: Colors.lightGreen[50]),
              body1: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
              body2: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white70)
          ),
        ),
      home: MyHomePage(title: 'AssisTEA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  final _widgetOptions = [
    Agenda(),
    Ava(),


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("AssisTEA", style: Theme.of(context).textTheme.headline),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.today), title: Text('Agenda')),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), title: Text('Asistente')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
      drawer: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,96,0),
        child: Container(

          color: Colors.lightGreen[50],
          child: ListView(


            children: <Widget>[


              Container(
                height: 112.0,
                child: DrawerHeader(child:

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                            children: <Widget>[
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[Text("Hola Mario, ¿Cómo te sientes hoy?", style:TextStyle(fontSize: 14.0, color: Colors.black54))],),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                              ActionChip(backgroundColor: Colors.blue[50], label: Text("😄",  style:TextStyle(fontSize: 16.0, color: Colors.black87)), onPressed: () => null,),
                              ActionChip(backgroundColor: Colors.green[50], label: Text("😊", style:TextStyle(fontSize: 16.0, color: Colors.black87)), onPressed: () => null),
                              ActionChip(backgroundColor: Colors.orange[50], label: Text("😥", style:TextStyle(fontSize: 16.0, color: Colors.black87)), onPressed: () => null),
                              ActionChip(backgroundColor: Colors.grey[200], label: Text("😞", style:TextStyle(fontSize: 16.0, color: Colors.black87)), onPressed: () => null),
                                ],
                              ),
                            ],
                          ),
                      ),

                  decoration: new BoxDecoration(
                    color: Colors.lightGreen[100]
                ),),
              ),

              ListTile(leading: const Icon(Icons.insert_drive_file), title: Text('Progreso', style:TextStyle(fontSize: 16.0, color: Colors.black87))),
              ListTile(leading: const Icon(Icons.videogame_asset), title: Text('Juegos', style:TextStyle(fontSize: 16.0, color: Colors.black87))),
              ListTile(leading: const Icon(Icons.insert_emoticon), title: Text('Medallas', style:TextStyle(fontSize: 16.0, color: Colors.black87))),
              ListTile(leading: const Icon(Icons.contacts), title: Text('Contactos', style:TextStyle(fontSize: 16.0, color: Colors.black87))),
              new Divider(
                height: 16.0,
              ),
              ListTile(leading: const Icon(Icons.help_outline), title: Text('Ayuda de la App', style:TextStyle(fontSize: 16.0, color: Colors.black87))),
              ListTile(leading: const Icon(Icons.settings), title: Text('Configuración', style:TextStyle(fontSize: 16.0, color: Colors.black87))),
              ListTile(leading: const Icon(Icons.info_outline), title: Text('Sobre AssisTEA', style:TextStyle(fontSize: 16.0, color: Colors.black87))),
              new Divider(
                height: 32.0,
              ),
              ListTile(title: Text("The Mighty Genius Team for UCLM", style:TextStyle(fontSize: 16.0, color: Colors.black87))),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
