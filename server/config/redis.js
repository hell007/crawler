/**
 * @name：redis配置文件
 * @author: jie
 */

const redis = require('redis')
const config = require('./index')

const client = redis.createClient(config.redis.port, config.redis.host)

client.on('error', (err) => {
	console.log('redis Error' + err)
})

module.exports = client;