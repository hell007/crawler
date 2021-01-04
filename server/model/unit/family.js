/**
 * @name：family unit
 * @author: jie
 */

const Sequelize = require('sequelize')

//引入数据库
const db = require('../../config/mysql')

const Family = db.define('Family', {
  id: {
    type: Sequelize.INTEGER.UNSIGNED,
    autoIncrement: true,
    primaryKey: true
  },
  userId: {
    type: Sequelize.INTEGER.UNSIGNED,
    allowNull: false
  },
  name: {
    type: Sequelize.STRING(50),
    allowNull: false
  },
  gender: {
    type: Sequelize.INTEGER.UNSIGNED,
    defaultValue: 0
  },
  relationship: {
    type: Sequelize.STRING(20)
  }
}, {
  freezeTableName: true,
  tableName: 'test_family',
  timestamps: false,
  underscored: false
})



module.exports = Family