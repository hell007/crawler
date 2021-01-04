/**
 * @name: access路由
 * @author: jie
 */
const router = require('express').Router()
const Op = require('sequelize').Op
const Logger = require('log4js').getLogger('index')

const Access = require('../model/access')
const Utils = require('../utils/index')


/**
 * @api {get} /api/access/list 访问列表
 * @apiDescription 访问列表
 * @apiName list
 * @apiGroup Access
 * @apiSuccess {json} response 返回数据
 * @apiSuccessExample {json} Success-Response:
 *  {
 *      "success" : "true",
 *      "data" : [],
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/access/list
 * @apiVersion 1.0.0
 */
router.get('/list', (req, res) => {
  let params = req.query;
  Logger.info(params)
  Access.findAll({
    where: {
      roleId: {
        [Op.eq]: params.id
      }
    },
    attributes: ['permissionId']
  }).then(data => {
    res.json(Utils.setResult(true, data, '操作成功！'));
  }).catch(ex => {
    Logger.error('/api/access/list->' + ex);
    res.json(Utils.setResult(false, ex, '操作失败！'));
  })
});

/**
 * @api {get} /api/access/save 访问保存
 * @apiDescription 访问列表
 * @apiName save
 * @apiGroup Access
 * @apiSuccess {json} response 返回数据
 * @apiSuccessExample {json} Success-Response:
 *  {
 *      "success" : "true",
 *      "data" : [],
 *      "message" : ""
 *  }
 * @apiErrorExample {json} Error-Response:
 *  {
 *     "success" : "false",
 *     "data" : ex,
 *     "message" : ""
 *  }
 * @apiSampleRequest http://localhost:9000/api/access/save
 * @apiVersion 1.0.0
 */
router.post('/save', (req, res) => {
  let params = req.body.params
  Logger.info(params)

  Access.destroy({
    where: {
      roleId: params.roleId
    },
    truncate: false
  }).then(ok => {
    Access.bulkCreate(params.arr).then(data => {
      res.json(Utils.setResult(true, data, '操作成功！'));
    }).catch(ex => {
      Logger.error('/api/access/save->' + ex);
      res.json(Utils.setResult(false, ex, '操作失败！'));
    })
  }).catch(ex => {
    Logger.error('/api/access/save->' + ex);
    res.json(Utils.setResult(false, ex, '操作失败！'));
  });
});

module.exports = router