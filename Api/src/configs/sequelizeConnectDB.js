require('dotenv').config({path:'../../.env'})
const acessEnvs = require('./acess')
const { Sequelize } = require('sequelize');

const sequelize = new Sequelize({
    dialect: 'mysql',
    database: acessEnvs.databaseName,
    username: acessEnvs.userAcess,
    password: acessEnvs.passwd,
    host: acessEnvs.hostAcess,
    port: acessEnvs.portAcess
});
module.exports = sequelize;