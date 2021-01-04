/**
 * @name：工具
 * @author: jie
 */
const fs = require('fs')
const jwt = require('jsonwebtoken')
const Logger = require('log4js').getLogger('index')
const formidable = require('formidable')
const UUID = require('uuid');

const config = require('../config/index')
const redis = require('../config/redis')
const User = require('../model/user')

module.exports = {
	setUUID: () => {
		return UUID.v1().toString().replace(/-/g,'');
	},
	/* 设置Token */
	setToken: (user, time = config.redis.expire) => {
		// 加密token
		let token = jwt.sign(user, config.secret);
		redis.set(config.pretoken + token, true, (err, data) => {
			if (err) {
				Logger.error('setToken' + err);
			} else {
				// 设置过期时间
				Logger.info('setToken' + data);
				redis.expire(config.pretoken + token, time);
			}
		});

		if (time === 0) {
			token = null;
		}
		return token;
	},
	/* 检查token */
	checkToken: (req, res) => {
		const token = req.headers['authorization'] || req.body.token;
		if (token) {
			redis.get(config.pretoken + token, (err, data) => {
				if (err) {
					Logger.error('checkToken' + err);
					res.redirect('/login');
				}
				if (data) {
					Logger.i('checkToken' + data);
					redis.set(config.pretoken + token, true);
					redis.expire(config.pretoken + token, config.redis.expire);
				}
			});
		} else {
			// api 不带token不让访问
			res.status(500).send({});
		}
	},
	/* 接口统一返回格式 */
	setResult: (success = true, data = null, message = '') => {
		return {
			success: success,
			data: data,
			message: message
		}
	}
}