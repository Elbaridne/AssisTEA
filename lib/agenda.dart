import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<Image> imgList = [
  Image.asset('/')
  
];

List fototexto = [
      ["A veces, nos puede doler la tripa", "assets/img/barriga.png", "Paso 1"],
      ["Entonces, vamos al médico", "assets/img/medico.png", "Paso 1"],
      ["El médico nos hace preguntas", "assets/img/preg.png", "Paso 1"],
      ["Nos toca...", "assets/img/toca.png", "Paso 2"],
      ["La barriga", "assets/img/barriga.png", "Paso Final"],
      ["Entonces, vamos al médico", "assets/img/medico.png", "Paso Final"]

    ];

class Agenda extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Agenda();
  }

}

class _Agenda extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body:Padding(
        padding: const EdgeInsets.fromLTRB(16.0,32.0,16.0,0),
        child: ListView(
          children: <Widget>[
            horario("Mañana 9:00 ",context),

            buildCard("Voy al médico", "assets/img/medico.png"),
            crearCarrousel(fototexto),
            new Divider(
              height: 8.0,
            ),


            horario("Tarde 13:00 ",context),
            buildCard("Acudir a la asamblea", "assets/img/asamblea.jpg"),
            crearCarrousel(fototexto),
          ],
        ),
      )
    );
  }

  Card horario(String hora, BuildContext context) {
    return Card(
            color: Colors.purple[700],
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Icon(Icons.alarm, size: 32, color: Colors.white70,),
                Text(hora, style: Theme.of(context).textTheme.body2,)

              ],),
            ),
          );
  }

  Card crearCarrousel(List fotos) {
    return Card(color: Colors.purple[100],
              child:
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: new CarouselSlider(
                  items: fotos.map((i) {
                    return new Builder(
                      builder: (BuildContext context) {
                        return new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: new EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: new BoxDecoration(
                                color: Colors.purple[100]
                            ),
                            child: Column(children: <Widget>[
                              Text(i[2], style:Theme.of(context).textTheme.body2),
                              Image.asset(i[1]),
                              Text(i[0], style: Theme.of(context).textTheme.body1,)
                            ],)
                        );
                      },
                    );
                  }).toList(),
                  height: 320.0,
                  autoPlay: false
              ),
            )
          );
  }

  Card buildCard(String texto, String img) {
    return Card(
          color: Colors.purple[400],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(img, width: 64, height: 64,),
                Text(texto, style: Theme.of(context).textTheme.title),
              ],
            ),
          )
        );
  }

}
