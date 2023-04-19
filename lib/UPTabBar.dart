import 'package:flutter/material.dart';

class UPMainTabBarCtrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TabBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UPTabBar(title: 'Flutter TabBar Demo'),
    );
  }
}

class UPTabBar extends StatefulWidget {
  const UPTabBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UPTabBar> createState() => _UPTabBarState();
}

class _UPTabBarState extends State<UPTabBar> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 安全边距
    final double topPadding = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _controller,
        children: const<Widget>[
          Center(child: Text('Tab 1')),
          Center(child: Text('Tab 2')),
          Center(child: Text('Tab 3')),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          // top: topPadding,
          bottom: bottomPadding,
        ),
        color: Colors.blue,
        child: TabBar(
          controller: _controller,
          tabs: const <Tab>[
            Tab(text: 'home',icon: Icon(Icons.home)),
            Tab(text: 'business', icon: Icon(Icons.business)),
            Tab(text: 'school', icon: Icon(Icons.school)),
          ],
        ),
      ),
    );
  }
}
