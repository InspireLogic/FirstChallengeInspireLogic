const sequelize = require('../configs/sequelizeConnectDB');
const { Model, DataTypes } = require('sequelize');
const validateDatabase = require('./utils');

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
    }

},{
    sequelize,
    modelName: 'TripModel',
    tableName: 'trips',
    timestamps: false
})
validateDatabase(TripModel);
(async () => {

    // try {
    //     const teste = await TripModel.findAll();
    //     console.log(teste.map(agent => agent.toJSON()));
    // } catch (err) {
    //     console.error('Erro:', err.message);
    // }
})();