import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: ListView(
            children: [
              TapBoxA(),
              ParentWidget(),
              ParentWidget2(),
            ],
          )
        )
      )
    );
  }
}

//A mix-and-match approach
//highlight-> internal (the stateful widget manages some of the state)
//active->export to parents(the parent widget manages other aspects of the state)
class ParentWidget2 extends StatefulWidget{
  @override
  _ParentWidget2State createState() => _ParentWidget2State();
}

class _ParentWidget2State extends State<ParentWidget2>{
  bool _active = false;

  void _handleTap(bool newState){
    setState(() {
      _active = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TapBoxC(
        active:_active,
        onChanged: _handleTap
      )
    );
  }
}


class TapBoxC extends StatefulWidget{
  TapBoxC({Key key, this.active = false, this.onChanged}):super(key:key);
  final bool active;
  final ValueChanged<bool> onChanged;
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC>{
    bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      onTapDown:_handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel:_handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          )
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active? Colors.lightGreen: Colors.grey,
          border: _highlight?
              Border.all(
                color: Colors.red,
                width: 10.0
              ): null
        ),
      )
    );
  }
}



//The parent widget manages the widget’s state
class ParentWidget extends StatefulWidget{
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>{
  int value = 0;

  void _handleTapboxChanged(value){
    setState(() {
      this.value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TapBoxB(
        value: value,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapBoxB extends StatelessWidget{
  TapBoxB({Key key, this.value:10, @required this.onChanged}): super(key:key);

  int value;
  final ValueChanged<int> onChanged;

  void _handleTap(){
    value += 1;
    onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child:Center(
          child: Text(
            //active? 'Active' : 'Inactive',
            '$value',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          )
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: value%2==1? Colors.lightGreen : Colors.grey
        ),
      )
    );
  }
}



//The widget manages its own state
class TapBoxA extends StatefulWidget{
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA>{
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child:Text(
            _active? "Active" : "Inactive",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          )
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active? Colors.lightGreen : Colors.grey
        ),
      ),
    );
  }
}
