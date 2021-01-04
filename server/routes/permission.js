/**
 * @name: 权限路由
 * @author: jie
 */
const router = require('express').Router()
const Op = require('sequelize').Op
const Logger = require('log4js').getLogger('index')

const Permission = require('../model/permission')
const Utils = require('../utils/index')


// list
router.post('/list', (req, res) => {
  let params = req.body.params
  Logger.info(params)

  Permission.findAll({
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
      attributes: ['id', 'name', 'pid', 'level', 'status']
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/permission/list->' + ex);
      res.json(Utils.setResult(false, ex, '操作失败！'));
    })
});

// permissions
router.get('/permissions', (req, res) => {
  let params = req.query;
  Logger.info(params)
  Permission.findAll({
      where: {
        level: params.level,
        status: 1
      },
      attributes: ['id', 'name']
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/permission/permissions->' + ex);
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

// item
router.get('/item', (req, res) => {
  let params = req.query;
  Logger.info(params)
  Permission.findOne({
      where: {
        id: params.id,
        status: 1
      },
      //attributes: []
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/permission/item->' + ex);
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

// save
router.post('/save', (req, res) => {
  let params = req.body.params
  Logger.info(params)

  if (params.id) {
    //update
    Permission.update(params, {
        where: {
          id: params.id
        }
      })
      .then(data => {
        res.json(Utils.setResult(true, data, '操作成功！'));
      })
      .catch(ex => {
        Logger.error('/api/permission/save->' + ex);
        res.json(Utils.setResult(false, ex, '操作失败！'))
      })
  } else {
    //save
    Permission.create(params)
      .then(data => {
        res.json(Utils.setResult(true, data, '操作成功！'));
      })
      .catch(ex => {
        Logger.error('/api/permission/save->' + ex);
        res.json(Utils.setResult(false, ex, '操作失败！'))
      })
  }
});

// destroy
router.post('/delete', (req, res) => {
  let params = req.body.params
  Logger.info(params)
  Permission.destroy({
      where: {
        id: params.id
      }
    })
    .then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/permission/delete' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

// 批量删除
router.post('/batchdelete', (req, res) => {
  let params = req.body.params
  Logger.info(params)
  Permission.destroy({
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
      Logger.error('/api/permission/batchdelete' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});

// 批量修改 status = 2
router.post('/close', (req, res) => {
  let params = req.body.params
  Logger.info(params)
  Permission.update({
      status: 2
    }, /* 设置属性的值 */ {
      where: {
        id: {
          [Op.in]: params.ids.length > 0 ? params.ids : []
        }
      }
    }).spread((affectedCount, affectedRows) => {
      Logger.info(affectedCount, affectedRows);
      /*return Permission.findAll({
        where: {
          status: 1
        },
        attributes: ['id', 'name', 'pid', 'level']
      });*/
    }).then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    })
    .catch(ex => {
      Logger.error('/api/permission/close' + ex)
      res.json(Utils.setResult(false, ex, '操作失败！'))
    })
});


module.exports = router