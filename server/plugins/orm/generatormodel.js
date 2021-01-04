/**
 * @name：自动生成的数据库模型
 * @author: jie
 */
const fs = require('fs')
const path = require('path')

const modelpath = path.join(__dirname, '../../model')
const indexJs = modelpath + '/index.js'
let files = fs.readdirSync(modelpath) //读取所有的生成模块文件
let models = []

files.forEach(item => {
  if (item != 'index.js') { //除了这个index.js
    // 下面这段代码结果是将： tb_user.js  转换为name为 User
    let names = item.split('.')[0].split('_')
    let name = ''
    for (let i = 1; i < names.length; i++) {
      name += names[i].substring(0, 1).toUpperCase() + names[i].substring(1)
    }
    models.push({
      name: name,
      path: "./" + item
    })
  }
})

// 视情况未定
const template = `
const Sequelize =  require('sequelize');

// 创建数据库连接
const sequelize = new Sequelize("csms-system","root","admin",{
    host:"127.0.0.1",
    dialect:"mysql",
    underscored:true
});

// 数据库模型名称配置及路径
const models=${JSON.stringify(models,null,4)};

// 数据库模型输出
models.forEach(item=>{
    module.exports[item.name]=require(item.path)(sequelize,Sequelize);
})`

fs.writeFile(indexJs, template, function() {
  console.log('success')
})