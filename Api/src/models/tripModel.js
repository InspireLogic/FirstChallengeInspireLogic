const { Model, DataTypes } = require('sequelize');
const sequelize = require('../configs/sequelizeConnectDB');
const validateSyncModel = require('./utils');

class TripModel extends Model{}
TripModel.init({
     id:{
         type: DataTypes.INTEGER,
         autoIncrement: true,
         primaryKey: true
     },
     user_id: {
         type: DataTypes.INTEGER,
         allow_null: false,
         references:{
             model: 'UserModel',
             key: 'id'
         }
     },
    agent_id: {
        type: DataTypes.INTEGER,
        allow_null: false,
        references: {
            model: 'agents',
            key: 'id'
        }
    },
    start_date: {
        type: DataTypes.DATE,
        allow_null: false
    },
    end_date: {
        type: DataTypes.DATE,
        allow_null: false
    },
    local_price:{
        type: DataTypes.DECIMAL(10,2),
        allow_null: false
    },
    status: {
        type: DataTypes.ENUM('plannig','canceled','confirmed'),
        allow_null: true
    }
 },{
     sequelize,
     modelName: 'TripModel',
     tableName: 'trips',
     timestamps: false
})
module.exports = TripModel;