const Lodging = require('../models/lodgingModel');
const { sequelize } = require('../models'); 

class LodgingService {
  static async checkTableExists() {
    const tables = await sequelize.getQueryInterface().showAllTables();
    return tables.includes('lodging'); 
  }

  static async createLodging(lodgingData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('The lodging table does not exist in the database.');

      const newLodging = await Lodging.create(lodgingData);
      return newLodging;
    } catch (error) {
      throw new Error(`Error creating hosting: ${error.message}`);
    }
  }

  static async getAllLodgings() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('The lodging table does not exist in the database.');

      return await Lodging.findAll();
    } catch (error) {
      throw new Error(`Error when searching for accommodation: ${error.message}`);
    }
  }

  static async getLodgingById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('The lodging table does not exist in the database.');

      const lodging = await Lodging.findByPk(id);
      return lodging;
    } catch (error) {
      throw new Error(`Hosting search error: ${error.message}`);
    }
  }

  static async updateLodging(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('The lodging table does not exist in the database.');

      const lodging = await Lodging.findByPk(id);
      if (!lodging) return null;

      await lodging.update(updateData);
      return lodging;
    } catch (error) {
      throw new Error(`Error updating hosting: ${error.message}`);
    }
  }

  static async deleteLodging(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('The lodging table does not exist in the database.');

      const lodging = await Lodging.findByPk(id);
      if (!lodging) return null;

      await lodging.destroy();
      return true;
    } catch (error) {
      throw new Error(`Error deleting hosting: ${error.message}`);
    }
  }
}

module.exports = LodgingService;
