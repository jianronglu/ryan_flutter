import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';

class HttpClientApp extends StatelessWidget {
  const HttpClientApp({Key? key}) : super(key: key);

  void gethttpClientData() async {
    try {
      HttpClient client = HttpClient();
      // 发起请求
      HttpClientRequest request = await client.getUrl(Uri.parse('http://127.0.0.1:3000'));

      // 返回数据
      HttpClientResponse response = await request.close();

      final result = await response.transform(utf8.decoder).join();
      print(result);

    } catch (e) {
      print('请求失败：$e');
    } finally {
      print('finally');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'http client',
      home: Scaffold(
        appBar: AppBar(
          title: Text('http client request'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => gethttpClientData(),
            child: Text('request', style: TextStyle(fontSize: 30),),
          ),
        ),
      ),
    );
  }
}
