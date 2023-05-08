import 'package:flutter/material.dart';
// import 'package:ryan_flutter/UPCupTabBarCtl.dart';
import 'package:ryan_flutter/UPHomePage.dart';
import 'package:ryan_flutter/study/interface/ryan_theme.dart';
import 'package:ryan_flutter/study/interface/ryan_url_launcher.dart';
// import 'package:ryan_flutter/UPToolTabBar.dart';
// import 'package:ryan_flutter/UPTabBar.dart';
// import 'package:ryan_flutter/UPCarouselView.dart';

void main() {
  // runApp(const UPCupertinoApp());// iOS风格控件
  // runApp(const UPToolTabBar());
  // runApp(UPCarouselView());
  runApp(const UrlLauncherApp());
}

class RyanApp extends StatefulWidget {
  const RyanApp({Key? key}) : super(key: key);

  @override
  State<RyanApp> createState() => _RyanAppState();
}

class _RyanAppState extends State<RyanApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      title: "ryan app",
      home:const Scaffold(
        // appBar: AppBar(
        //   title: const Text("Ryan"),
        // ),
        body:const HomePage(),
      ),
      // home: HomePage(),
    );
  }
}
