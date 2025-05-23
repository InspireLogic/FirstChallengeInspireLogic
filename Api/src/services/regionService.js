const RegionsModel = require('../models/regionsModel');
const { sequelize } = require('../models'); 

class RegionService {
  static async checkTableExists() {
    const tables = await sequelize.getQueryInterface().showAllTables();
    return tables.map(t => t.toLowerCase()).includes('regions');
  }

  static async createRegion(regionData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table regions does not exist in the database.');

      const newRegion = await RegionsModel.create(regionData);
      return newRegion;
    } catch (error) {
      throw new Error(`Error creating region: ${error.message}`);
    }
  }

  static async getAllRegions() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table regions does not exist in the database.');

      return await RegionsModel.findAll();
    } catch (error) {
      throw new Error(`Error when searching for regions: ${error.message}`);
    }
  }

  static async getRegionById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table regions does not exist in the database.');

      const region = await RegionsModel.findByPk(id);
      return region;
    } catch (error) {
      throw new Error(`Region search error: ${error.message}`);
    }
  }

  static async updateRegion(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table regions does not exist in the database.');

      const region = await RegionsModel.findByPk(id);
      if (!region) return null;

      await region.update(updateData);
      return region;
    } catch (error) {
      throw new Error(`Error when updating region: ${error.message}`);
    }
  }

  static async deleteRegion(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table regions does not exist in the database.');

      const region = await RegionsModel.findByPk(id);
      if (!region) return null;

      await region.destroy();
      return true;
    } catch (error) {
      throw new Error(`Error deleting region: ${error.message}`);
    }
  }
}

module.exports = RegionService;
