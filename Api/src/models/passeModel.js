const { Model, DataTypes } = require('sequelize');
const sequelize = require('../configs/sequelizeConnectDB');
const validateSyncModel = require('./utils');

class PasseModel extends Model{}

PasseModel.init({
    id:{
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
     resort_id:{
        type: DataTypes.INTEGER,
        allow_null: false,
        references: {
            model: 'ResortsModel',
            key: 'id'
        }
    },
    type: {
        type: DataTypes.ENUM('daily', 'weekend', 'vactions','holidays'),
        allow_null: true
    },
    validity_days: {
        type: DataTypes.INTEGER,
        allow_null: false
    }

},{
    sequelize,
    modelName: 'PasseModel',
    tableName: 'passes',
    timestamps: false
})
module.exports = PasseModel;