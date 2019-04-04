
## 依赖


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

    apidoc -i routes/ -o apidoc/
    
4、访问

    http://localhost:9000/apidoc/index.html
  
