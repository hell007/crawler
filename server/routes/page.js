/**
 * @name: 多页面路由
 * @author: jie
 */

const express = require('express')
const router = express.Router()

const config = require('../config/index')

// 页面设置
const pages = [{
	"path": "/",
	"render": "index"
},{
	"path": "/login",
	"render": "login/index"
},{
	"path": "/home",
	"render": "home/index"
},{
	"path": "/user/index",
	"render": "user/index"
}, {
	"path": "/user/edit/:id",
	"render": "user/form"
}];


// 路由循环
pages.forEach(item => {
	router.get(item.path, (req, res, next) => {
		res.render(item.render, {
			base: config.basepath,
			path: item.path
		});
	});
})

module.exports = router;