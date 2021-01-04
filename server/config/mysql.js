/**
 * @name：mysql配置文件
 * @author: jie
 */

const Sequelize = require('sequelize');

const connection = new Sequelize('csms-system', 'root', 'admin', {
	host: 'localhost', //数据库域名
	dialect: 'mysql',
	timezone: 'Asia/Shanghai', // 缺少时间相差8小时
	pool: {
		max: 5,
		min: 0,
		idle: 10000
	}
});

module.exports = connection