/**
 * @name：model
 * @author: jie
 */

const Sequelize =  require('sequelize');

// 创建数据库连接
const sequelize = new Sequelize("csms-system","root","admin",{
    host:"127.0.0.1",
    dialect:"mysql",
    underscored:true
});

// 数据库模型名称配置及路径
const models=[
    {
        "name": "User",
        "path": "./user.js"
    },
    {
        "name": "Role",
        "path": "./role.js"
    },
    {
        "name": "Access",
        "path": "./access.js"
    },
    {
        "name": "Permission",
        "path": "./permission.js"
    }
];

// 数据库模型输出
models.forEach(item=>{
    module.exports[item.name]=require(item.path)(sequelize,Sequelize);
})