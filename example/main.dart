import 'package:flutter/material.dart';
import 'package:animatecon/animatecon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<AnimateConState> _key = GlobalKey<AnimateConState>();
  bool _btnEnabled = true;

  void _animate() {
    if (!_btnEnabled) return;

    _key.currentState!.animate({"y": 100, "alpha": 0.0}, {"y": 0.0, "alpha": 1.0},
        time: 500, ease: animateEase.back.easeOut, onComplete: () {
      _btnEnabled = true;
    });
    _btnEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimateCon(
          key: _key,
          initProp: const {"alpha": 0},
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animate,
        tooltip: 'Animate',
        child: Icon(Icons.animation),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
