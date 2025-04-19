const { DataTypes, Model } = require('sequelize');
const sequelize = require('../configs/sequelizeConnectDB');

class ResortModel extends Model {}

ResortModel.init({
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  region_id: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  name_resort: {
    type: DataTypes.STRING(60),
    allowNull: false
  },
  description: {
    type: DataTypes.TEXT,
    allowNull: true
  },
  lift_access: {
    type: DataTypes.BOOLEAN,
    allowNull: false
  },
  image_url: {
    type: DataTypes.STRING(100),
    allowNull: false
  }
}, {
  sequelize,
  modelName: 'Resort',
  tableName: 'resorts',
  timestamps: false
});

module.exports = ResortModel;
