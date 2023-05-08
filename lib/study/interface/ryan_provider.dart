import 'package:flutter/material.dart';

/// 使用 setState 同步状态
class RyanStateApp extends StatefulWidget {
  const RyanStateApp({Key? key}) : super(key: key);

  @override
  State<RyanStateApp> createState() => _RyanStateAppState();
}

class _RyanStateAppState extends State<RyanStateApp> {
  int _counter = 0;
  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }
  void _reset(){
    setState(() {
      _counter = 0;
    });
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontSize: 30,
      color: Color(int.parse('222222', radix: 16)).withOpacity(1),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'provider',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,//居中对齐
            children: <Widget>[
              Text('click times', style: _textStyle(),),
              Text(
                  '第：$_counter 次点击',
                style: _textStyle()
              ),
              ElevatedButton(onPressed: _incrementCounter, child: Text('Add', style: _textStyle(),)),
              ElevatedButton(onPressed: _reset, child: Text('Reset', style: _textStyle(),))
            ],
          ),
        ),
      ),
    );
  }
}

