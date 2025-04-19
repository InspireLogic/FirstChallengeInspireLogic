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
      if (!exists) throw new Error('Tabela regions não existe no banco de dados.');

      const newRegion = await RegionsModel.create(regionData);
      return newRegion;
    } catch (error) {
      throw new Error(`Erro ao criar região: ${error.message}`);
    }
  }

  static async getAllRegions() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela regions não existe no banco de dados.');

      return await RegionsModel.findAll();
    } catch (error) {
      throw new Error(`Erro ao buscar regiões: ${error.message}`);
    }
  }

  static async getRegionById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela regions não existe no banco de dados.');

      const region = await RegionsModel.findByPk(id);
      return region;
    } catch (error) {
      throw new Error(`Erro ao buscar região: ${error.message}`);
    }
  }

  static async updateRegion(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela regions não existe no banco de dados.');

      const region = await RegionsModel.findByPk(id);
      if (!region) return null;

      await region.update(updateData);
      return region;
    } catch (error) {
      throw new Error(`Erro ao atualizar região: ${error.message}`);
    }
  }

  static async deleteRegion(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela regions não existe no banco de dados.');

      const region = await RegionsModel.findByPk(id);
      if (!region) return null;

      await region.destroy();
      return true;
    } catch (error) {
      throw new Error(`Erro ao deletar região: ${error.message}`);
    }
  }
}

module.exports = RegionService;
