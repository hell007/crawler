/**
 * @name：role
 * @author: jie
 */

const Sequelize =  require('sequelize')

//引入数据库
const db = require('../config/mysql')  

module.exports = db.define('Role', {
  roleId: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    field: 'role_id'
  },
  pid: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  roleName: {
    type: Sequelize.STRING(20),
    allowNull: false,
    field: 'role_name'
  },
  description: {
    type: Sequelize.STRING(100),
    allowNull: true
  },
  status: {
    type: Sequelize.INTEGER,
    allowNull: false
  }
},{  
  freezeTableName: true, 
  tableName: 'jie_role', 
  timestamps: false,
  underscored: false
}) 


// 默认false修改表名为复数，true不修改表名，与数据库表名同步 
// 驼峰转下划线  需要field