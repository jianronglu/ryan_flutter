
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherApp extends StatelessWidget {
  const UrlLauncherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _launcher() async{
      Uri _url = Uri.parse('https://github.com/');
      if(!await launchUrl(_url)) {
        throw Exception('Could not launcher $_url');
      }
    }

    return MaterialApp(
      title: 'url_launcher',
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text('btn', style: TextStyle(fontSize: 50),),
            onPressed: (){
              _launcher();
            },
          ),
        ),
      ),
    );
  }
}
