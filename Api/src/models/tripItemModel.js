const { Model, DataTypes } = require('sequelize');
const sequelize = require('../configs/sequelizeConnectDB');
const validateSyncModel = require('./utils');

class TripItemModel extends Model{}

TripItemModel.init({
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    trip_id: {
        type: DataTypes.INTEGER,
        allow_null: false,
        references:{
            model: 'TripModel',
            id: 'id'
        }
    },
    item_type: {
        type: DataTypes.ENUM('lodgings', 'pass', 'resorts'),
        allow_null: false,
    },
    item_id: {
      type: DataTypes.INTEGER,
      allow_null: false
    },
    quantity: {
        type: DataTypes.INTEGER,
        allow_null: false,
    },
    price: {
        type: DataTypes.DECIMAL(10,2),
        allow_null: false
    }
},{
    sequelize,
    modelName: 'TripItemModel',
    tableName: 'trip_items',
    timestamps: false
})
module.exports = TripItemModel;