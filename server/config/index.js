/**
 * @name：项目配置文件
 * @author: jie
 */

module.exports = {
  host: 'http://127.0.0.1',
  port: 9000,
  sslport: 443,
  basepath: 'http://127.0.0.1:9000/',// views页面base使用
  pretoken: 'jie-',//token前缀
  secret: 'jie-admin', //token密码
  redis: {
    port: 6379,
    host: '127.0.0.1',
    secret: 'ecp',
    expire: 60*5 //5分钟
  },
  uploadpath: '/upload/'
}