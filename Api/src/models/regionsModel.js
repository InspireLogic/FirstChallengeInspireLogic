const { Model, DataTypes } = require('sequelize');
const validateDatabase = require('./utils');
const sequelize = require('../configs/sequelizeConnectDB');
class RegionsModel extends Model{}

RegionsModel.init({
    id: {
       type: DataTypes.INTEGER,
       autoIncrement: true,
       primaryKey: true
   },
    name_local:{
      type: DataTypes.STRING(60),
      allow_null: false
    },
    description: {
        type: DataTypes.TEXT,
        allow_null: true
    },
    image_url: {
        type: DataTypes.STRING(100),
        allow_null: true
    }
},{
    sequelize,
    modelName: 'RegionsModel',
    tableName: 'regions',
    timestamps: false
});
module.exports = RegionsModel;