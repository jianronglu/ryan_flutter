import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// iOS 风格TabBar
class UPCupertinoApp extends StatelessWidget {
  const UPCupertinoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,

      ),
      title: 'iOS 风格TabBar',
      home: UPTabBarCtl(title: 'cupertino TabBar'),
    );
  }
}

class UPTabBarCtl extends StatefulWidget {
  const UPTabBarCtl({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UPTabBarCtl> createState() => _UPTabBarCtlState();
}

class _UPTabBarCtlState extends State<UPTabBarCtl> {
  int _selectedIndex = 0;

  int get getSelectedIndex => _selectedIndex; //getter
  set setSelectedIndex(int index) { // setter
    _selectedIndex = index;
    print('index:$index');// 生产不能调用
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Text('首页')),
    const Center(child: Text('行情')),
    const Center(child: Text('交易')),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const<BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.business), label: '行情'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: '交易'),
          ],
          currentIndex: getSelectedIndex, //getter
          onTap: (int index) {
            setState(() {
              setSelectedIndex = index; // setter
            });
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return _widgetOptions.elementAt(_selectedIndex);
            },
          );
        }
    );
  }
}

