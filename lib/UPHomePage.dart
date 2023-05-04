import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _buildListItem(BuildContext context, int index) {
    return ListTile(
      title: Text('data $index'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('CustomScrollView'),
          floating: true,
        ),
        SliverGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing:5,
          childAspectRatio:2,// 宽/高比
          children: List.generate(18, (index) => Container(
            color: Colors.grey[(index % 9  + 1) * 100],
            child: Center(
              child: Text('Item $index'),
            ),
          )),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => _buildListItem(context, index),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
