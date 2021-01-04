/**
 * @name：user unit
 * @author: jie
 */

const Sequelize = require('sequelize')

//引入数据库
const db = require('../../config/mysql')
//const Info = require('./info')
//const Family = require('./family')


const User = db.define('User', {
  id: {
    type: Sequelize.INTEGER.UNSIGNED,
    autoIncrement: true,
    primaryKey: true
  },
  username: {
    type: Sequelize.STRING(20),
    allowNull: false
  }
}, {
  freezeTableName: true,
  tableName: 'test_user',
  timestamps: false,
  underscored: false
})

/*User.associate = function() {
  User.hasOne(Info, {
    foreignKey: 'userId'
  });
  User.hasMany(Family, {
    foreignKey: 'userId',
    targetKey: 'id'
  });
}*/


module.exports = User