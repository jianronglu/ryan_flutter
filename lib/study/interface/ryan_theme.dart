import 'package:flutter/material.dart';
import 'package:ryan_flutter/study/common/ryan_common_helper.dart';

class ThemeApp extends StatefulWidget {
  const ThemeApp({Key? key}) : super(key: key);

  @override
  State<ThemeApp> createState() => _ThemeAppState();
}

class _ThemeAppState extends State<ThemeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      theme: ThemeData(
        brightness: Brightness.light,

        primaryColor: UPCommonColorUtil.colorWithHexStr('888888'),
        indicatorColor: Colors.orange,

        scaffoldBackgroundColor:UPCommonColorUtil.colorWithHexStr(),//Scaffold 主题背景色

        appBarTheme: AppBarTheme(//APPBar 主题
          backgroundColor: UPCommonColorUtil.colorWithHexStr(),
          titleTextStyle:const TextStyle(
            fontSize: 30,
            color: const Color.fromRGBO(255, 0, 0, 1),//标题红色
          ),
          // elevation: 100,
          shadowColor: Colors.black12,//导航栏阴影颜色
        ),

        textTheme: TextTheme(
          titleLarge: const TextStyle(
            fontSize: 50,
          ),
          titleMedium: const TextStyle(
            fontSize: 45,
            color: Colors.red,
          ),
          titleSmall: TextStyle(
            fontSize: 40,
            color: UPCommonColorUtil.colorWithHexStr('DDDDDD'),
          ),
          bodyLarge: TextStyle(
            fontSize: 30,
            color: UPCommonColorUtil.colorWithHexStr('DDDDDD'),
          )
        ),
      ),

      home:const ThemeUseage(),
    );
  }
}

class ThemeUseage extends StatefulWidget {
  const ThemeUseage({Key? key}) : super(key: key);

  @override
  State<ThemeUseage> createState() => _ThemeUseageState();
}

class _ThemeUseageState extends State<ThemeUseage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Theme 体验'),
      ),
      // floatingActionButton: Text('button',style: TextStyle(color: Colors.red, fontSize: 20, backgroundColor: Colors.cyan),),
      floatingActionButton: FloatingActionButton(
        child:const Text('btn',style: TextStyle(color: Colors.red, fontSize: 20/*, backgroundColor: Colors.cyan*/),),
        tooltip: '哈哈哈',// 长按的时候会提示
        onPressed:() {
          print('点击了按钮');
        },
      ),
      body: Container(
        // color: Theme.of(context).primaryColor,// 使用主题
        child: Text(
          '1 2 3',
          // style: TextStyle(
          //   fontSize: 100,
          //   // backgroundColor: Colors.green,
          //   color: Theme.of(context).primaryColor, // 使用主题
          // ),
          // style: Theme.of(context).textTheme.bodyLarge,// 使用主题
          style: Theme.of(context).textTheme.titleMedium,//[Theme]主题使用 Theme.of(context) 找最近主题
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}