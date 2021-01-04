/**
 * @name: 测试路由
 * @author: jie
 */
const express = require('express')
const router = express.Router()
const sequelize =  require('sequelize')
const Op = sequelize.Op

const db = require('../../config/mysql')

const User = require('../../model/user')



// findOne 
router.get('/item', (req, res) => {
  User.findOne({
    where: {
      // or
      [Op.or]: [{name: 'admin'}, {mobile: '13888888888'}],
      status: 1
    },
    order: sequelize.literal('createTime ASC'),
    attributes: ['id','name','mobile','email','ip','status','createTime','loginTime']
  }) 
  .then(function(data) {
    res.json(data);
  })
  .catch(function(ex) {
    res.json(ex)
  })
});

// findAll 
router.get('/list', (req, res) => {
  User.findAll({
    where: {
      status: 1
    },
    // 排序
    order: [
      ['createTime','ASC']
    ],
    attributes: ['id','name','mobile','email','ip','status','createTime','loginTime']
  }) 
  .then(function(data) {
    res.json(data);
  })
  .catch(function(ex) {
    res.json(ex)
  })
});

// findAndCountAll 分页 / 限制
router.get('/list2', (req, res) => {
  //let params = req.body.params;
  let params = {
    name: 'admin',
    status: 1,
    pageNum: 1,
    pageSize: 10,
  }
  User.findAndCountAll({
    where: {
      name: {
        [Op.like]: `${params.name}%`
      },
      status: params.status || 1
    },
    order: sequelize.literal('createTime ASC'),
    offset: params.pageSize * (params.pageNum - 1),
    limit: params.pageSize || 10,
    attributes: ['id','name','mobile','email','ip','status','createTime','loginTime']
  }) 
  .then(function(data) {
    res.json(data);
  })
  .catch(function(ex) {
    res.json(ex)
  })
});


/*************关联查询************************************************/

// 需求：查询用户时候，将用户的角色也查询出来；

// belongsTo：将关联键插入到 source 模型中
// User.belongsTo(Role, {foreignKey: 'roleId'}); // 等同于下面语句
// User.belongsTo(Role, {foreignKey: 'roleId', targetKey: 'roleId'});


router.get('/item2', (req, res) => {
  User.findOne({
    include: [{
      model: Role,
      where: {
        status: 1
      },
      attributes: ['roleName','description']
    }],
    where: {
      // or
      [Op.or]: [{name: 'admin'}, {mobile: '13888888888'}],
      status: 1
    },
    // order: [
    //  ["id", 'desc']
    // ],
    attributes: ['id','name','mobile','email','ip','status']
  }) 
  .then(function(data) {
    res.json(data);
  })
  .catch(function(ex) {
    res.json(ex)
  })
});


// hasOne：在 target 模型中插入关联键
// Role.hasOne(User, { foreignKey: 'role_id' }) //没成功过，不知哪里问题


// 需求：查询用户时候，将用户的权限也查询出来；

// hasMany
// User.hasMany(Role, {foreignKey: 'roleId'});
//Access.belongsTo(User, {foreignKey: 'roleId', targetKey: 'roleId'})



router.get('/item2', (req, res) => {
  User.findOne({
    include: [{
      model: Role,
      where: {
        status: 1
      },
      attributes: ['roleName','description']
    }],
    where: {
      // or
      [Op.or]: [{name: 'admin'}, {mobile: '13888888888'}],
      status: 1
    },
    // order: [
    //  ["id", 'desc']
    // ],
    attributes: ['id','name','mobile','email','ip','status']
  }) 
  .then(function(data) {
    res.json(data);
  })
  .catch(function(ex) {
    res.json(ex)
  })
});



router.post('/token',  (req, res, next) => {
	//console.log('token===',req.headers['authorization'])
	var token = req.headers['authorization'] || req.body.token;
  res.json({
  	success: true, 
  	token: token
	})
})



module.exports = router

