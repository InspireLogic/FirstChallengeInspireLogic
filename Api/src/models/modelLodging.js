const { Model, DataTypes } = require('sequelize');
const sequelize = require('../configs/databaseConn');

class Lodging extends Model {}

Lodging.init({
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true
  },
  region_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'regions',
      key: 'id'
    }
  },
  name_lodging: {
    type: DataTypes.STRING(60),
    allowNull: false
  },
  type: {
    type: DataTypes.ENUM('camping', 'hotel', 'hosted', 'resort'),
    allowNull: true
  },
  price_per_night: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false
  },
  max_guests: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  image_url: {
    type: DataTypes.STRING(100),
    allowNull: false
  }
}, {
  sequelize,
  modelName: 'Lodging',
  tableName: 'lodging',
  timestamps: false // não há created_at nem updated_at na tabela
});

module.exports = Lodging;
