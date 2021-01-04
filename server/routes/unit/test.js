/**
 * @name: Sequelize对mysql的基本使用
 * @author: jie
 */
const express = require('express')
const router = express.Router()
const Sequelize = require('sequelize')
const Op = Sequelize.Op
const Logger = require('log4js').getLogger('index')
const fs = require('fs')
const formidable = require('formidable')

const db = require('../../config/mysql')
const config = require('../../config/index')
const Utils = require('../../utils/index')

const User = require('../../model/unit/user')
const Info = require('../../model/unit/info')
const Family = require('../../model/unit/family')

//es6
router.get('/es6', (req, res) => {

  let response = {
    success: false,
    data: null,
    message: ''
  };

  (async() => {
    try {

      response.data = await User.findAll({
        include: [{
          all: true
        }]
      });

      response.success = true;
      response.message = '查询成功！';

      Logger.info(response);
    } catch (ex) {
      Logger.error(ex);
      response.data = ex
    } finally {
      res.json(response);
    }
  })();

});


// upload
router.post('/upload', (req, res) => {

  var form = new formidable.IncomingForm({
    encoding: 'utf-8', //上传编码
    multiples: true, //支持多文件
    uploadDir: 'static' + config.uploadpath, //上传目录
    keepExtensions: true, //保留后缀
    maxFieldsSize: 2 * 1024 * 1024 //文件大小
  });

  var allFile = [];
  //在控制台打印文件上传进度
  form.on('file', function(filed, file) {
      allFile.push(file);
    })
    .parse(req, function(err, fields, files) {
      if (err) {
        Logger.error(err);
      }
      /*allFile.forEach(function(item, index) {
        let filename = item.name;
        let filepath = item.path;
        let type = item.name.split('.');
        fs.renameSync(filepath, form.uploadDir + "/" + type[0] + "." + String(type[type.length - 1]));
      });*/
    })
    .on('end', function() {
      res.json(Utils.setResult(true, allFile, '上传成功！'));
    })
    .on('error', function(ex) {
      Logger.error(ex);
      res.json(Utils.setResult(false, ex, '上传失败！'));
    });
});

// upload
router.post('/upload3', (req, res) => {
  var form = new formidable.IncomingForm({
    encoding: 'utf-8', //上传编码
    multiples: true, //支持多文件
    uploadDir: 'static' + config.uploadpath, //上传目录
    keepExtensions: true, //保留后缀
    maxFieldsSize: 2 * 1024 * 1024 //文件大小
  });

  var allFile = [];
  //在控制台打印文件上传进度
  form.on('progress', function(bytesReceived, bytesExpected) {
      var progressInfo = {
        value: bytesReceived,
        total: bytesExpected
      };
      //console.log('[progress]: ' + JSON.stringify(progressInfo));
      //res.write(JSON.stringify(progressInfo));
    })
    .on('file', function(filed, file) {
      Logger.info(filed + '<====>' + JSON.stringify(file));
      allFile.push([filed, file]);
    })
    .parse(req, function(err, fields, files) {
      if (err) {
        Logger.error(err);
      }
      /*console.log('fields===',fields);
      console.log('path===',files.file.path);
      console.log('name===',files.file.name);*/
      allFile.forEach(function(file, index) {
        var fieldName = file[0];
        var types = file[1].name.split('.');
        var date = new Date();
        var ms = Date.parse(date);
        //重命名文件，默认的文件名是带有一串编码的，还原为原先的名字
        fs.renameSync(file[1].path, form.uploadDir + "/" + types[0] + "." + String(types[types.length - 1]));
      });
    })
    .on('end', function() {
      res.json(Utils.setResult(true, allFile, '上传成功！'));
    })
    .on('error', function(ex) {
      Logger.error(ex);
      res.json(Utils.setResult(false, ex, '上传失败！'));
    });
});

// crud

// create
router.get('/add', (req, res) => {
  User.create({
      username: '曹操'
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});

router.get('/add2', (req, res) => {
  Info.create({
      age: 20,
      address: '深圳',
      userId: 1
    })
    .then(() => {
      Info.findOrCreate({
        where: {
          address: '深圳'
        },
        defaults: {
          userId: 1
        }
      })
    })
    .spread((info, created) => {
      console.log('info===', info.get({
        plain: true
      }))
      console.log('created===', created)
      res.json(created);
    })
    .catch(ex => {
      res.json(ex)
    })
});

// update

router.get('/update', (req, res) => {
  User.update({
      username: '刘备',
    }, {
      where: {
        id: 12
      }
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});

User.username = '333'
router.get('/save', (req, res) => {
  User.save()
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});


//destroy

router.get('/delete', (req, res) => {
  User.destroy({
      where: {
        id: 11
      }
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});


// select

router.get('/select', (req, res) => {
  User.findAll({
      include: [{
        all: true
      }]
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});

// 批量操作

router.get('/batchc', (req, res) => {
  User.bulkCreate([{
      username: 'ccc'
    }, {
      username: 'ddd'
    }, {
      username: 'eee'
    }]).then(() => { // 注意: 这里没有凭据, 然而现在你需要...
      return User.findAll();
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});

router.get('/batchu', (req, res) => {
  User.update({
      username: 'update'
    }, /* 设置属性的值 */ {
      where: {
        id: {
          [Op.in]: [13, 14, 15]
        }
      }
    }).spread((affectedCount, affectedRows) => {
      // .update 在数组中返回两个值，因此我们使用 .spread
      // 请注意，affectedRows 只支持以 returning: true 的方式进行定义

      // affectedCount 将会是 2
      return User.findAll();
    }).then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});

router.get('/batchd', (req, res) => {
  User.destroy({
      where: {
        id: {
          [Op.in]: [5, 6]
        }
      },
      truncate: false /* 这将忽略 where 并用 truncate table 替代  */
    }).then(affectedRows => {
      // affectedRows 将会是 2
      return User.findAll();
    }).then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});



// 一对一hasOne

User.hasOne(Info, {
  foreignKey: 'userId'
});

// 预加载 
router.get('/list', (req, res) => {
  db.sync().then(() => {
    User.findAll({
        include: [{
          model: Info
        }]
      })
      .then(data => {
        res.json(data);
      })
      .catch(ex => {
        res.json(ex)
      })
  })
});

// 当一个表中两个字段同时外联同一张表时,可以添加as来添加别称，
// 使用时在include中也要使用相同的别称，就可以正常使用了

User.hasOne(Info, {
  as: 'userInfo',
  foreignKey: 'userId'
});

router.get('/list1', (req, res) => {
  User.findAll({
      include: [{
        model: Info,
        as: 'userInfo'
      }]
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});

router.get('/list2', (req, res) => {
  User.findAll({
      include: [{
        model: Info,
        where: {
          age: {
            [Op.gt]: 20
          }
        }
      }]
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});

// 一对一belongsTo

Info.belongsTo(User, {
  foreignKey: 'userId',
  targetKey: 'id'
});

router.get('/list3', (req, res) => {
  Info.findAll({
      include: [{
        model: User
      }],
      where: {
        age: {
          [Op.gt]: 20
        }
      }
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});


// 一对多 hasMany


User.hasMany(Family, {
  foreignKey: 'userId',
  targetKey: 'id'
});

router.get('/list4', (req, res) => {
  User.findAll({
      include: {
        model: Family
      }
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});


// 一对多 belongsTo

Family.belongsTo(User, {
  foreignKey: 'userId',
  targetKey: 'id'
});

router.get('/list5', (req, res) => {
  Family.findAll({
      include: {
        model: User
      }
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});



// 多对多belongsToMany

const Teacher = require('../../model/unit/teacher')
const Lesson = require('../../model/unit/lesson')
const Relation = require('../../model/unit/relation')

Lesson.belongsToMany(Teacher, {
  through: Relation,
  foreignKey: 'lessonId',
  otherKey: 'teacherId'
});

router.get('/list6', (req, res) => {
  Lesson.findAll({
      include: {
        model: Teacher
      }
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});

// 事务

router.get('/list7', (req, res) => {
  // 受管理的事务（auto-callback）
  db.transaction(function(t) {
    // 要确保所有的查询链都有return返回
    return User.create({
      username: 'ccc',
    }, {
      transaction: t
    }).then(function(user) {
      return user.setShooter({
        username: 'ddd',
      }, {
        transaction: t
      });
    });
  }).then(data => {
    // Transaction 会自动提交
    // data 是事务回调中使用promise链中执行结果
    res.json(data);
  }).catch(ex => {
    // Transaction 会自动回滚
    // ex 是事务回调中使用promise链中的异常结果
    res.json(ex)
  });
});

router.get('/list7', (req, res) => {
  // 受管理的事务（auto-callback）
  db.transaction(function(t) {
    // 要确保所有的查询链都有return返回
    return User.create({
      username: 'ccc',
    }, {
      transaction: t
    }).then(function(user) {
      return user.setShooter({
        username: 'ddd',
      }, {
        transaction: t
      });
    });
  }).then(data => {
    // Transaction 会自动提交
    // data 是事务回调中使用promise链中执行结果
    res.json(data);
  }).catch(ex => {
    // Transaction 会自动回滚
    // ex 是事务回调中使用promise链中的异常结果
    res.json(ex)
  });
});

router.get('/list8', (req, res) => {
  // 不受管理的事务（then-callback）
  db.transaction().then(function(t) {
    return User.create({
      username: 'eee',
    }, {
      transaction: t
    }).then(function(user) {
      return user.addSibling({
        username: 'fff',
      }, {
        transaction: t
      });
    }).then(function() {
      return t.commit();
    }).catch(function(err) {
      return t.rollback();
    });
  });
});

// es6
/*router.get('/list9', (req, res) => {
  let transaction;
  try {
    //测试事务
    transaction = await this.ctx.model.transaction();
    const model1 = {
      "email": "aaaa@qq.com",
      "password": "2332"
    };
    const model2 = {
      "email": "1234443423@qq.com",
      "password": "33"
    };
    await ctx.service.admin.insertOne(model1, transaction);
    await ctx.service.admin.insertOne(model2, transaction);
    await transaction.commit();
    console.log("事务运行成功");
    return true;
  } catch (e) {
    await transaction.rollback();
    console.log("回滚成功");
    return false
  }
});*/



// 原生查询

router.get('/list7', (req, res) => {
  const sql = 'select * from test_user where id = :id'
  db.query(sql, {
      replacements: {
        id: '1' //按:后的标识名传入其替换成的值
      },
      type: Sequelize.QueryTypes.SELECT //指定查询类型
    })
    .then(data => {
      res.json(data);
    })
    .catch(ex => {
      res.json(ex)
    })
});



module.exports = router

// 总结:

// 一对一  一对多  多对多

// 1、在参数中include是可以在里面继续嵌套include的