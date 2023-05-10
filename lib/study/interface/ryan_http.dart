import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> arguments) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  final url = Uri.http('127.0.0.1:3000');

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final items = jsonResponse['data'];
    if (items is List) {
      List arr = items;
      arr.forEach((item) {
        //print(item);//flutter: {name: å¼ ä¸}
        final value = item['name'];
        String decodedValue = utf8.decode(value.runes.toList());// 编码
        print(decodedValue);
      });
    } else {
      // err data
    }

    print('Number of books about http: ${items.length}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
/*
在 Mac 上使用 Node.js 部署一个服务，你可以按照以下步骤进行操作：

创建一个新的文件夹来存放你的服务代码。打开终端（Terminal），使用 mkdir 命令创建一个新文件夹，例如：

mkdir my-service
cd my-service
在该文件夹中，使用你喜欢的编辑器创建一个新的 JavaScript 文件，例如 server.js。
const http = require('http');

const server = http.createServer((req, res) => {
  const data = {
    code: '0',
    message: 'success',
    data: [
      { name: '张三' },
      { name: '李四' },
      { name: '王五' }
    ]
  };

  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify(data));
});

const port = 3000;

server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

在终端中，使用以下命令来安装所需的依赖项：
npm install

node server.js
你应该会看到终端输出 Server running on port 3000，表示服务已成功启动。

现在，你的服务应该在 http://localhost:3000 上运行，并返回状态码 200 和预定义的 JSON 数据。你可以使用浏览器或其他 HTTP 客户端工具来访问该 URL，或在其他应用程序中通过 HTTP 请求访问它。

在终端中按下 Ctrl + C 后，你可能会看到一些终止进程的输出信息，如 "^C" 或 "Terminated"。这表示你的 Node.js 服务已成功停止。
 */