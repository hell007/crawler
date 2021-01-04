/**
 * @name：teacher unit
 * @author: jie
 */

const Sequelize = require('sequelize')
const {
  INTEGER,
  STRING,
  TEXT
} = Sequelize

//引入数据库
const db = require('../../config/mysql')


const Teacher = db.define('Teacher', {
  id: {
    type: INTEGER.UNSIGNED,
    autoIncrement: true,
    primaryKey: true
  },
  name: {
    type: STRING(20),
    allowNull: false
  }
}, {
  freezeTableName: true,
  tableName: 'test_teacher',
  timestamps: false,
  underscored: false
})


module.exports = Teacher