import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MaterialApp(
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
// ============================================================================
/// Provider
///  [flutter pub add provider]
///

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: const ProviderApp(),
    ),
  );
}

class Counter with ChangeNotifier {// mixi
 int _count = 0; //存储数据

 int get count => _count;//提供外部访问

 void increment(){
   _count++;
   notifyListeners();//通知监听对象刷新
 }
 void reset() {
   _count = 0;
   notifyListeners();//通知监听对象刷新
 }
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ryan',
      home: RyanHomePage(),
    );
  }
}

class RyanHomePage extends StatelessWidget {
  const RyanHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle () => TextStyle(fontSize: 30, color: Colors.red);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ryan provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('Clicked Times', style: _textStyle(),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),//垂直方向对称
              child: Count(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () => context.read<Counter>().reset(),
                  child: Text('reset', style: _textStyle().copyWith(color: Colors.cyan, fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,// 按钮背景色
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),//圆角半径10
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        child: Text('ADD', style: _textStyle().copyWith(fontSize: 20),),// copyWith 快速修改其中某个属性
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}',style:TextStyle(fontSize: 30));
  }
}
