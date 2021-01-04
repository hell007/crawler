/**
 * @name：access
 * @author: jie
 */

const Sequelize =  require('sequelize')

//引入数据库
const db = require('../config/mysql')  

module.exports = db.define('Access', {
  id: {
    type: Sequelize.STRING(36),
    primaryKey: true,
    unique: true,
    allowNull: false
  },
  roleId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    field: 'role_id'
  },
  permissionId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    field: 'permission_id'
  }
},{  
  freezeTableName: true, 
  tableName: 'jie_access', 
  timestamps: false,
  underscored: false
}) 


// 默认false修改表名为复数，true不修改表名，与数据库表名同步 
// 驼峰转下划线  需要field