const databaseConn = require('../configs/sequelizeConnectDB');
const checkDatabaseConnection = require('../configs/checkDataBaseConnection');

const validateDatabase = async (model) => {
    try {
        const isConnected = await checkDatabaseConnection();
        if (!isConnected) throw new Error('Database connection failed');
        await databaseConn.authenticate(); // garante que a conexão está OK
        return await model.sync();
    } catch (error) {
        throw new Error(`Database validation error: ${error.message}`);
    }
};

module.exports = validateDatabase;