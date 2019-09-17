import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainRoute(),
    );
  }
}

class MainRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FirstImageRoute()));
                  },
                  child: Image.asset("images/pic0.jpg"),
                ),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondImageRoute()));
                    },
                    child: Image.asset("images/pic1.jpg")
                ),
              ),
              Expanded(
                child:GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdImageRoute()));
                    },
                    child: Image.asset("images/pic2.jpg")
                )
              )
            ],
          )
        ],
      )
    );
  }
}

class FirstImageRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Navigation To First Image"),
        ),
        body: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                child: Center(
                    child: Image.asset("images/pic0.jpg")
                ),
            )
        )
    );
  }
}

class SecondImageRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Navigation To Second Image"),
        ),
        body: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Image.asset("images/pic1.jpg")
              ),
            )
        )
    );
  }
}

class ThirdImageRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Navigation To Third Image"),
        ),
        body: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Image.asset("images/pic2.jpg")
              ),
            )
        )
    );
  }
}