const handleDatabaseErro = require('./handleErro');
const sequelize = require('./sequelizeConnectDB');
async function checkDataBaseConnection(){
    try{
        return await sequelize.authenticate();
    }catch(error){
        handleDatabaseErro(error);
        throw error
    }
}
module.exports = checkDataBaseConnection;