/**
 * @name  : app.js
 * @author: jie
 */

// 依赖
const express = require('express')
const fs = require('fs')
const path = require('path')
const ejs = require('ejs')
const session = require('express-session')
const history = require('connect-history-api-fallback')
const http = require('http')
const https = require('https')

// 中间件
// 在控制台中，显示req请求的信息
//const morgan = require('morgan') 

// 用于处理JSON,Raw,Text和URL编码的数据
const bodyParser = require('body-parser') 

// 日志处理
const log4js = require('log4js')

// 引入
const config = require('./config/index')
const routes = require('./routes/index')

// 使用
const app = express()

// 载入中间件
log4js.configure('./config/log4js.json');
app.use(log4js.connectLogger(log4js.getLogger('http'), { level: 'auto' }))

// log only 4xx and 5xx responses to console
/*app.use(morgan('dev', {
		skip: function(req, res) {
			return res.statusCode < 400
		}
	}))
	// log all requests to access.log
app.use(morgan('common', {
	stream: fs.createWriteStream(path.join(__dirname, 'access.log'), {
		flags: 'a'
	})
}))*/

// json
app.use(bodyParser.urlencoded({
	extended: false
}))
app.use(bodyParser.json())

// session
app.use(session({
	secret: 'keyboard cat',
	resave: false,
	saveUninitialized: true,
	cookie: {
		secure: false
	}
}));

// 处理文件
app.use('/static', express.static(path.join(__dirname, 'static')))
// 配置模板引擎
//app.set('views', path.join(__dirname, 'views'))
//app.engine('.html', ejs.__express)
//app.set('view engine', 'html')

// 跨域设置，上线需删除
app.all('*', function(req, res, next) {
    console.log(req.method);
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Headers', 'Content-type');
    res.header("Access-Control-Allow-Methods", "PUT,POST,GET,DELETE,OPTIONS,PATCH");
    res.header('Access-Control-Max-Age',1728000);//预请求缓存20天
    next();  
});

routes(app);

// history必须在路由下，否则错误
app.use(history());

//监听端口
app.listen(config.port, () => {
	console.log('..............................................')
	console.log('dev is running')
})


/*const httpServer = http.createServer(app);
httpServer.listen(config.port, ()=> {
	console.log('====',httpServer.address())
	var host = httpServer.address().address;
	var port = httpServer.address().port;
	console.log('test')
});*/

/*const httpsServer = https.createServer(credentials, app);
httpsServer.listen(config.sslPort, function() {
	var host = httpsServer.address().address;
	var port = httpsServer.address().port;
	console.log('Example app listening at http://'+host+':'+ port);
});*/

module.exports = app;