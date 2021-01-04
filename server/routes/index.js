/**
 * @name: 路由配置
 * @author: jie
 */
const Logger = require('log4js').getLogger('index')

const config = require('../config/index')
const redis = require('../config/redis')
const Utils = require('../utils/index')


module.exports = (app) => {

	// 登录拦截器，必须放在静态资源声明之后、路由导航之前、history之前
	/*app.use((req, res, next) => {
		const user = req.session.user
		const url = req.originalUrl;
		const regex = /^\/api/;

		if (!regex.test(url)) {
			if (url != '/login' && !user) {
				Logger.info('登录拦截,跳转到登录页')
				res.redirect('/login');
			}
		} else {
			if ( url != '/api/user/signin') {
				Utils.checkToken(req, res);
			}
		}
		next();
	});*/

	//app.use('/', require('./page'));

	// unit test
	app.use('/api/test', require('./unit/test'));
	// api
	app.use('/api/user', require('./user'));
	app.use('/api/role', require('./role'));
	app.use('/api/permission', require('./permission'));
	app.use('/api/access', require('./access'));

};