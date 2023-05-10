import 'package:dio/dio.dart';

void ryan_dio() async {
  try {
    final dio = Dio();
    print('ryan_dio_start');
    final response = await dio.get('http://127.0.0.1:3000');
    // final response = await dio.get('https://pub.dev');
    print(response.data);
  } catch(e) {
    print('请求失败：$e');
  } finally {
    print('ryan_dio_end');
  }
}