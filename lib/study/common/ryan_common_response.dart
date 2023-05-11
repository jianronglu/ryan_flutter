
import 'package:flutter/foundation.dart';

typedef ResponseCallBack = void Function(ApiResponse);

class ApiResponse<T> with Diagnosticable{
  final int code;
  final String errMsg;
  final T? data;

  ApiResponse({
   required this.code,
   required this.errMsg,
   required this.data,
  });

  factory ApiResponse.fromJson(Map<String,dynamic> json) {
    return ApiResponse(
        code: json['code'],
        errMsg: json['errMsg'] ?? '',
        data: json['data'],
    );
  }

// print(obj.toString(minLevel: DiagnosticLevel.fine));
// 输出: ApiResponse(code: 0, errMsg: success, data: [{name: 张三}, {name: 李四}, {name: 王五}])

// print(obj.toString(minLevel: DiagnosticLevel.warning));
// 输出: ApiResponse

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    if (minLevel.index <= DiagnosticLevel.fine.index) {
      return 'ApiResponse(code: $code, errMsg: $errMsg, data: $data)';
    }
    return 'ApiResponse';
  }
}