import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ryan_flutter/study/common/ryan_common_response.dart';
import 'dart:io';
import 'package:ryan_flutter/study/interface/ryan_dio.dart';
import 'package:ryan_flutter/study/common/ryan_constant_define.dart';

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
            // onPressed: () => gethttpClientData;
            onPressed: (){
              ryan_dio_get(getUserList, callback:(result){
                ApiResponse rsp = result as ApiResponse;

                print('返回结果：${rsp.toString(minLevel: DiagnosticLevel.fine)}');
              });
            },

            child: Text('request', style: TextStyle(fontSize: 30),),
          ),
        ),
      ),
    );
  }
}
