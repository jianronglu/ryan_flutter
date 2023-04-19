import 'package:flutter/material.dart';

class UPToolTabBar extends StatefulWidget {
  const UPToolTabBar({Key? key}) : super(key: key);

  @override
  State<UPToolTabBar> createState() => _UPToolTabBarState();
}

class _UPToolTabBarState extends State<UPToolTabBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car),),
                    Tab(icon: Icon(Icons.directions_transit),),
                    Tab(icon: Icon(Icons.directions_bike),),
                  ]
              ),
              title: const Text('sgzq demo'),
            ),
            body: const TabBarView(
              children: [
                Tab(icon: Icon(Icons.directions_car),),
                Tab(icon: Icon(Icons.directions_transit),),
                Tab(icon: Icon(Icons.directions_bike),),
              ],
            ),
          )
      ),
    );
  }
}
