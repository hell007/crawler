/**
 * @name：info unit
 * @author: jie
 */

const Sequelize = require('sequelize')

//引入数据库
const db = require('../../config/mysql')
//const User = require('./user')


const Info = db.define('Info', {
  id: {
    type: Sequelize.INTEGER.UNSIGNED,
    autoIncrement: true,
    primaryKey: true
  },
  age: {
    type: Sequelize.INTEGER.UNSIGNED
  },
  address: {
    type: Sequelize.STRING(50)
  }
}, {
  freezeTableName: true,
  tableName: 'test_user_info',
  timestamps: false,
  underscored: false
})

/*Info.associate = function() {
  Info.belongsTo(User, {
    foreignKey: 'userId',
    targetKey: 'id'
  });
}
*/


module.exports = Info