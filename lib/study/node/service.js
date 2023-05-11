
/// cd 到路径
/// [node server.js] 启动服务
const http = require('http');
const path = require('path');

const server = http.createServer((req, res) => {

  const url = req.url;

  switch(url) {
   case '/getUserList': {//获取用户列表
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
   }
  }
});

const port = 3000;

server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});