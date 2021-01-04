/**
 * @name：permission
 * @author: jie
 */

const Sequelize =  require('sequelize')

//引入数据库
const db = require('../config/mysql')  

module.exports = db.define('Permission', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  name: {
    type: Sequelize.STRING(32),
    allowNull: false
  },
  pid: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  path: {
    type: Sequelize.STRING(100),
    allowNull: true
  },
  redirect: {
    type: Sequelize.STRING(100),
    allowNull: true
  },
  code: {
    type: Sequelize.STRING(100),
    allowNull: true
  },
  level: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  hidden: {
    type: Sequelize.INTEGER,
    allowNull: false,
  },
  icon: {
    type: Sequelize.STRING(100),
    allowNull: true,
  },
  status: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  sort: {
    type: Sequelize.INTEGER,
    allowNull: false
  }
},{  
  freezeTableName: true, 
  tableName: 'jie_permission', 
  timestamps: false,
  underscored: false
}) 


// 默认false修改表名为复数，true不修改表名，与数据库表名同步 
// 驼峰转下划线  需要field
// 注意：id , name(label) 为getTree(nodes) <el-tree></el-tree> 使用