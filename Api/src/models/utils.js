const databaseConn = require('../configs/sequelizeConnectDB');
const checkDatabaseConnection = require('../configs/checkDataBaseConnection');
const req = require('./tripModel');

const validateSyncModel = async (model) =>{
    try{
        const isconnected = await checkDatabaseConnection();
        return isconnected? model.sync() : 'error connected or model';
    }catch (error){
        throw new Error(error);
    }
}
module.exports = validateSyncModel;