/**
 * @name: 用户路由
 * @author: jie
 */
const router = require('express').Router()
const Sequelize = require('sequelize')
const Op = Sequelize.Op
const Logger = require('log4js').getLogger('index')

const db = require('../config/mysql')
const User = require('../model/user')
const Role = require('../model/role')
const Utils = require('../utils/index')



// 登录

User.belongsTo(Role, {
  foreignKey: 'roleId',
  targetKey: 'roleId'
});

/**
 * @api {post} /api/user/signin 用户登录
 * @apiDescription 用户登录
 * @apiName signin
 * @apiGroup User
 * @apiParam {string} name 用户名
 * @apiParam {string} password 密码
 * @apiSuccess {json} response
 * @apiSuccessExample {json} 返回数据:
 *  {
 *      "success" : "true",
 *      "data" : {
 *          "name" : "name",
 *          "..."  : "..."
 *      },
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/user/signin
 * @apiVersion 1.0.0
 */
router.post('/signin', (req, res) => {
  let uname = req.body.name;
  let pwd = req.body.password;
  // 查询用户
  User.findOne({
      include: [{
        model: Role,
        where: {
          status: 1
        },
        attributes: ['roleName']
      }],
      where: {
        name: uname,
        status: 1
      },
      attributes: ['name', 'roleId', 'password']
    })
    .then(data => {
      const user = JSON.parse(JSON.stringify(data));
      if (user) {
        // 未加密处理
        if (user.password === pwd) {
          // token
          const token = Utils.setToken(user);
          user.token = token;
          // 获取权限
          let sql = 'select p.id, p.pid, p.level, p.path, p.redirect, p.name, p.icon  from jie_permission p where p.hidden =1 and p.`status` = 1 and p.id in (select a.permission_id from jie_access a where a.role_id = :id)';
          db.query(sql, {
              replacements: {
                id: user.roleId
              },
              type: Sequelize.QueryTypes.SELECT //指定查询类型
            })
            .then(data => {
              user.Permission = data
                // session
              req.session.user = user;
              // set password = ''
              user.password = '';
              res.json(Utils.setResult(true, user, '登录成功！'));
            })
            .catch(ex => {
              user.Permission = null
              Logger.error('/api/user/signin-> ' + ex);
            })
        } else {
          res.json(Utils.setResult(false, null, '用户名或者密码错误！'));
        }
      } else {
        Logger.error('/api/user/signin-> user不存在');
        res.json(Utils.setResult(false, null, '输入错误！'));
      }
    })
    .catch(ex => {
      Logger.error('/api/user/signin->' + ex)
      res.json(Utils.setResult(false, ex, '登录出错了！'));
    })
});

/**
 * @api {post} /api/user/signout 用户退出
 * @apiDescription 用户退出
 * @apiName signout
 * @apiGroup User
 * @apiSuccess {json} response 返回数据
 * @apiSuccessExample {json} Success-Response:
 *  {
 *      "success" : "true",
 *      "data" : token,
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/user/signout
 * @apiVersion 1.0.0
 */
router.post('/signout', (req, res) => {
  const user = req.session.user

  if (user) {
    const token = Utils.setToken(user, 0);
    req.session.user = null;
    res.json(Utils.setResult(true, token, '退出成功！'));
  } else {
    Logger.error('/api/user/signin-> 退出失败');
    res.json(Utils.setResult(false, null, '退出失败！'));
  }
});

/**
 * @api {post} /api/user/userinfo 用户信息
 * @apiDescription 用户信息
 * @apiName userinfo
 * @apiGroup User
 * @apiSuccess {json} response 返回数据
 * @apiSuccessExample {json} Success-Response:
 *  {
 *      "success" : "true",
 *      "data" : {},
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/user/userinfo
 * @apiVersion 1.0.0
 */
router.post('/userinfo', (req, res) => {
  let token = req.body.token;
  // session
  const user = req.session.user
  if (user.token === token) {
    res.json(Utils.setResult(true, user, '操作成功！'));
  } else {
    res.json(Utils.setResult(false, null, '操作失败！'));
  }
});

/**
 * @api {post} /api/user/list 用户列表
 * @apiDescription 用户信息
 * @apiName list
 * @apiGroup User
 * @apiSuccess {json} response 返回数据
 * @apiSuccessExample {json} Success-Response:
 *  {
 *      "success" : "true",
 *      "data" : {
 *        "rows" : {},
 *        "count" : Number
 *      },
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/user/list
 * @apiVersion 1.0.0
 */
router.post('/list', (req, res) => {
  let params = req.body.params
  Logger.info(params)

  User.findAndCountAll({
      include: [{
        model: Role,
        where: {
          status: 1
        },
        attributes: ['roleName']
      }],
      where: {
        name: {
          [Op.like]: `${params.name}%`
        },
        status: params.status ? {
          [Op.eq]: params.status
        } : {
          [Op.in]: [1, 2]
        }
      },
      offset: params.pageSize * (params.pageNum - 1),
      limit: params.pageSize || 10,
      attributes: ['id', 'name', 'mobile', 'email', 'ip', 'status', 'loginTime', 'createTime']
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/user/list->' + ex);
      res.json(Utils.setResult(false, ex, '操作失败！'));
    })
});

/**
 * @api {get} /api/user/item 用户获取
 * @apiDescription 用户获取
 * @apiName item
 * @apiGroup User
 * @apiParam {Number} id 用户id
 * @apiSuccess {json} response
 * @apiSuccessExample {json} 返回数据:
 *  {
 *      "success" : "true",
 *      "data" : {
 *          "id" : "id",
 *          "..." : "..."
 *      },
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/user/item
 * @apiVersion 1.0.0
 */
router.get('/item', (req, res) => {
  let params = req.query;
  Logger.info(params)
  User.findOne({
      where: {
        id: params.id,
        status: 1
      },
      attributes: ['id', 'name', 'roleId', 'mobile', 'email', 'ip', 'isSuper', 'status', 'createTime']
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/user/item->' + ex);
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

/**
 * @api {post} /api/user/save 用户保存
 * @apiDescription 用户保存
 * @apiName save
 * @apiGroup User
 * @apiSuccess {json} response 返回数据
 * @apiSuccessExample {json} Success-Response:
 *  {
 *      "success" : "true",
 *      "data" : ,
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/user/save
 * @apiVersion 1.0.0
 */
router.post('/save', (req, res) => {
  let params = req.body.params
  Logger.info(params)

  if (params.id) {
    //update
    User.update(params, {
        where: {
          id: params.id
        }
      })
      .then(data => {
        res.json(Utils.setResult(true, data, '操作成功！'));
      })
      .catch(ex => {
        Logger.error('/api/user/save->' + ex);
        res.json(Utils.setResult(false, ex, '操作失败！'))
      })
  } else {
    //save
    params.password = '000000' //默认密码
    User.create(params)
      .then(data => {
        res.json(Utils.setResult(true, data, '操作成功！'));
      })
      .catch(ex => {
        Logger.error('/api/user/save->' + ex);
        res.json(Utils.setResult(false, ex, '操作失败！'))
      })
  }
});

/**
 * @api {post} /api/user/delete 用户删除
 * @apiDescription 用户删除
 * @apiName delete
 * @apiGroup User
 * @apiSuccess {json} response 返回数据
 * @apiSuccessExample {json} Success-Response:
 *  {
 *      "success" : "true",
 *      "data" : ,
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/user/delete
 * @apiVersion 1.0.0
 */
router.post('/delete', (req, res) => {
  let params = req.body.params
  Logger.info(params)
  User.destroy({
      where: {
        id: params.id
      }
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/user/delete' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

/**
 * @api {post} /api/user/batchdelete 用户批量删除
 * @apiDescription 用户批量删除
 * @apiName batchdelete
 * @apiGroup User
 * @apiSuccess {json} response 返回数据
 * @apiSuccessExample {json} Success-Response:
 *  {
 *      "success" : "true",
 *      "data" : ,
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/user/batchdelete
 * @apiVersion 1.0.0
 */
router.post('/batchdelete', (req, res) => {
  let params = req.body.params
  Logger.info(params)
  User.destroy({
      where: {
        id: {
          [Op.in]: params.ids.length > 0 ? params.ids : []
        }
      },
      truncate: false /* 这将忽略 where 并用 truncate table 替代  */
    }).then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/user/batchdelete' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

/**
 * @api {post} /api/user/close 用户批量修改
 * @apiDescription 用户批量修改
 * @apiName close
 * @apiGroup User
 * @apiSuccess {json} response 返回数据
 * @apiSuccessExample {json} Success-Response:
 *  {
 *      "success" : "true",
 *      "data" : ,
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/user/close
 * @apiVersion 1.0.0
 */
router.post('/close', (req, res) => {
  let params = req.body.params
  Logger.info(params)
  User.update({
      status: 2
    }, /* 设置属性的值 */ {
      where: {
        id: {
          [Op.in]: params.ids.length > 0 ? params.ids : []
        }
      }
    }).then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/user/close' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});


module.exports = router