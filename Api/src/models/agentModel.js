const { Model, DataTypes } = require('sequelize');
const validateDatabase = require('./utils');
const sequelize = require('../configs/sequelizeConnectDB');

class  AgentModel extends Model{}

AgentModel.init(
    {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,
            allow_null: false
        },
        name_agents: {
            type: DataTypes.STRING(60),
            allow_null: false
        },
        email_agents:{
            type: DataTypes.STRING(60),
            allow_null: true
        },
        specialization:{
            type: DataTypes.STRING(10),
            allow_null: false
        },
        avaliable:{
            type: DataTypes.TINYINT,
            allow_null: false
        }
    },
    {
        sequelize,
        modelName: 'AgentModel',
        tableName: 'agents',
        timestamps: false
    }
)
module.exports = AgentModel;

