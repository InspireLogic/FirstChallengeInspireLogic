require('dotenv').config({path:'../../.env'});
const mysql = require('mysql2');
const acessEnvs = require('./acess')

const crendentialsDB = mysql.createPool({
    host: acessEnvs.hostAcess,
    user: acessEnvs.hostAcess,
    password: acessEnvs.passwd,
    database: acessEnvs.databaseName,
    port: acessEnvs.portAcess
})
module.exports = crendentialsDB;