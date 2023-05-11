import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:ryan_flutter/study/common/ryan_common_helper.dart';

final dio = Dio();

// void test() {
//   ryan_dio_get(getUserList, callback:(result){
//     ApiResponse rsp = result as ApiResponse;
//
//     print('返回结果：${rsp.toString(minLevel: DiagnosticLevel.fine)}');
//   });
// }

void ryan_dio_get(String path, {Map<String, dynamic>? queryParameters, ResponseCallBack? callback}) async {
  try {
    print('ryan_dio_start: ' + baseUrl + path);
    final response = await dio.get(baseUrl + path, queryParameters: queryParameters);
   if(callback != null) {
     callback(ApiResponse(code: int.parse(response.data['code']), errMsg: response.data['message'], data: response.data['data']));
   }
  } catch(error) {
    if (error is DioError) {
      if (error.response != null) {
        final statusCode = error.response!.statusCode;
        int code = !statusCode.isNull ? statusCode as int : net_dio_err;

        final data = error.response!.data;
        final headers = error.response!.headers;

        print('请求失败，状态码: $statusCode');
        print('响应数据: $data');
        print('响应头: $headers');
        if(callback != null) {
          callback(ApiResponse(code: code, errMsg: net_dio_msg, data: []));
        }
      } else {
        if(callback != null) {
          callback(ApiResponse(code: net_unknown_err, errMsg: net_unknown_msg, data: []));
        }
        print('请求失败，无响应');
      }
    } else {
      print('请求异常：$error');
    }
  } finally {
    print('ryan_dio_end: '+baseUrl+path);
  }
}