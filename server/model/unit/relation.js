/**
 * @name：relation unit
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


const Relation = db.define('Relation', {
  id: {
    type: INTEGER.UNSIGNED,
    autoIncrement: true,
    primaryKey: true
  },
  lessonId: {
    type: INTEGER.UNSIGNED,
    allowNull: false
  },
  teacherId: {
    type: INTEGER.UNSIGNED,
    allowNull: false
  }

}, {
  freezeTableName: true,
  tableName: 'test_relation',
  timestamps: false,
  underscored: false
})


module.exports = Relation