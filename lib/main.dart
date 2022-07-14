import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tic Tac Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[_Row(), _Row(), _Row()],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[_Box(), _Box(), _Box()],
    );
  }
}

enum Turn {
  x,
  o,
}

var player = Turn.x;

class _Box extends StatefulWidget {
  const _Box({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BoxState();
}

class _BoxState extends State<_Box> {
  var _color = Colors.grey;
  var _text = "";

  void _setSymbol() {
    setState(() {
      if (player == Turn.x) {
        _color = Colors.blue;
        _text = "X";
        player = Turn.o;
      } else {
        _color = Colors.red;
        _text = "O";
        player = Turn.x;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _setSymbol,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.10,
        height: MediaQuery.of(context).size.width * 0.10,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          color: _color,
        ),
        child: Center(
          child: Text(
            _text,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
