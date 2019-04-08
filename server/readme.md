
## 依赖

#### sequelize

[sequelize](https://github.com/demopark/sequelize-docs-Zh-CN)

#### jsonwebtoken

[jsonwebtoken](https://github.com/auth0/node-jsonwebtoken)


#### apiDoc 

[apiDoc](http://apidocjs.com/)

1、根目录配置apidoc.json

    {
      "name": "node-server-api",
      "version": "1.0.0",
      "description": "apiDoc 描述",
      "title": "apiDoc 文档",
      "url": "http://localhost:9000"
    }
    
2、编写api代码

3、命名

    apidoc -i routes/ -o static/apidoc/
    
4、访问

    http://localhost:9000/apidoc/index.html
  
#### formidable 

[formidable](https://github.com/felixge/node-formidable)

1、使用

    router.post('/upload', (req, res) => {
      var form = new formidable.IncomingForm({
        encoding: 'utf-8', //上传编码
        multiples: true, //支持多文件
        uploadDir: 'static' + config.uploadpath, //上传目录
        keepExtensions: true, //保留后缀
        maxFieldsSize: 2 * 1024 * 1024 //文件大小
      });
      var allFile = [];
      form.on('file', function(filed, file) {
          allFile.push(file);
        })
        .parse(req, function(err, fields, files) {
          if (err) {
            Logger.error(err);
          }
          /*allFile.forEach(function(item, index) {
            let filename = item.name;
            let filepath = item.path;
            let type = item.name.split('.');
            fs.renameSync(filepath, form.uploadDir + "/" + type[0] + "." + String(type[type.length - 1]));
          });*/
        })
        .on('end', function() {
          res.json(Utils.setResult(true, allFile, '上传成功！'));
        })
        .on('error', function(ex) {
          Logger.error(ex);
          res.json(Utils.setResult(false, ex, '上传失败！'));
        });
    });
    
    
