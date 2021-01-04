/**
 * @name：lesson unit
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


const Lesson = db.define('Lesson', {
  id: {
    type: INTEGER.UNSIGNED,
    autoIncrement: true,
    primaryKey: true
  },
  name: {
    type: STRING(20)
  }
}, {
  freezeTableName: true,
  tableName: 'test_lesson',
  timestamps: false,
  underscored: false
})


module.exports = Lesson