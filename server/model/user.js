/**
 * @name：user
 * @author: jie
 */

const Sequelize =  require('sequelize')
const moment = require('moment')

//引入数据库
const db = require('../config/mysql')

module.exports = db.define('User', {
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  roleId: {
    type: Sequelize.INTEGER,
    allowNull: false,
    field: 'role_id'
  },
  name: {
    type: Sequelize.STRING(20),
    allowNull: false
  },
  password: {
    type: Sequelize.STRING(32),
    allowNull: false
  },
  salt: {
    type: Sequelize.STRING(64),
    allowNull: true
  },
  email: {
    type: Sequelize.STRING,
    allowNull: true
  },
  mobile: {
    type: Sequelize.STRING(11),
    allowNull: false
  },
  ip: {
    type: Sequelize.STRING,
    allowNull: true
  },
  isSuper: {
    type: Sequelize.INTEGER,
    allowNull: false,
    field: 'is_super'
  },
  status: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  createTime: {
    type: Sequelize.DATE,
    allowNull: false,
    field: 'create_time',
    get() {
      let time = this.getDataValue('createTime')
      return time && moment(time).format('YYYY-MM-DD HH:mm:ss');
    }
  },
  loginTime: {
    type: Sequelize.DATE,
    allowNull: true,
    field: 'login_time',
    get() {
      let time = this.getDataValue('loginTime')
      return time && moment(time).format('YYYY-MM-DD HH:mm:ss');
    }
  }
},{  
  freezeTableName: true, 
  tableName: 'jie_user', 
  timestamps: false,
  underscored: false
}) 


// freezeTableName默认false修改表名为复数，true不修改表名，与数据库表名同步 
// 驼峰转下划线  需要field