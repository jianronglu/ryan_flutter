
import 'package:flutter/material.dart';

class Theme extends InheritedWidget {
 final ThemeData data;

 Theme({
   Key? key,
   required this.data,
   required Widget child,
 }) : super(key: key, child: child);

 static Theme of(BuildContext context) {
   final widget = context.dependOnInheritedWidgetOfExactType<Theme>();
   assert(widget != null, 'No Theme found in content');
   return widget!;
 }

  @override
  bool updateShouldNotify(Theme old) {
    return data != old.data;
  }
}

class MyWidge extends StatelessWidget {
  const MyWidge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'InheritedWidget',
      style: theme.data.textTheme.labelMedium,
    );
  }
}
