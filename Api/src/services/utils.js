const { sequelize } = require('../models');
const checkTableExists = async (model)=> {
    const tables = await sequelize.getQueryInterface().showAllTables();
    return tables.map(t => t.toLowerCase()).includes(`${model}`);
}

module.exports = checkTableExists;