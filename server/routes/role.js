/**
 * @name: 角色路由
 * @author: jie
 */
const router = require('express').Router()
const Op = require('sequelize').Op
const Logger = require('log4js').getLogger('index')

const Role = require('../model/role')
const Utils = require('../utils/index')



// roleList
router.get('/roleList', (req, res) => {
  Role.findAll({
      where: {
        status: 1
      },
      attributes: ['roleId', 'roleName']
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '查询成功！'));
    })
    .catch(ex => {
      Logger.error('/api/role/roleList->' + ex)
      res.json(Utils.setResult(false, ex, '查询失败！'))
    })
});

// list
router.post('/list', (req, res) => {
  let params = req.body.params
  Logger.info(params)

  Role.findAndCountAll({
      where: {
        roleName: {
          [Op.like]: `${params.name}%`
        },
        status: params.status ? {[Op.eq]: params.status} : {[Op.in]:[1,2]}
      },
      offset: params.pageSize * (params.pageNum - 1),
      limit: params.pageSize || 10,
      //attributes: ['roleId', 'roleName', 'pid', 'description', 'status']
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/role/list->' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

// item
router.get('/item', (req, res) => {
  let params = req.query;
  Logger.info(params)
  Role.findOne({
      where: {
        roleId: params.id,
        status: 1
      },
      attributes: ['roleId', 'roleName', 'pid', 'description', 'status']
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/role/item->' + ex);
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

// save
router.post('/save', (req, res) => {
  let params = req.body.params
  Logger.info(params)

  if (params.roleId) {
    //update
    Role.update(params, {
        where: {
          roleId: params.roleId
        }
      })
      .then(data => {
        res.json(Utils.setResult(true, data, '操作成功！'));
      })
      .catch(ex => {
        Logger.error('/api/role/save->update' + ex);
        res.json(Utils.setResult(false, ex, '操作失败！'))
      })
  } else {
    //save
    Role.create(params)
      .then(data => {
        res.json(Utils.setResult(true, data, '操作成功！'));
      })
      .catch(ex => {
        Logger.error('/api/role/save->create' + ex)
        res.json(Utils.setResult(false, ex, '操作失败！'))
      })
  }
});

// destroy
router.post('/delete', (req, res) => {
  let params = req.body.params
  Logger.info(params)
  Role.destroy({
      where: {
        roleId: params.roleId
      }
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/role/delete' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

// 批量删除
router.post('/batchdelete', (req, res) => {
  let params = req.body.params
  Logger.info(params)
  Role.destroy({
      where: {
        roleId: {
          [Op.in]: params.ids.length > 0 ? params.ids : []
        }
      },
      truncate: false /* 这将忽略 where 并用 truncate table 替代  */
    }).then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/role/batchdelete' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

// 批量修改 status = 2
router.post('/close', (req, res) => {
  let params = req.body.params
  Logger.info(params)
  Role.update({
      status: 2
    }, /* 设置属性的值 */ {
      where: {
        roleId: {
          [Op.in]: params.ids.length > 0 ? params.ids : []
        }
      }
    }).then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/role/close' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});


module.exports = router