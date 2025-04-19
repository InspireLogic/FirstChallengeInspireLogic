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
      if (!exists) throw new Error('Tabela lodging não existe no banco de dados.');

      const newLodging = await Lodging.create(lodgingData);
      return newLodging;
    } catch (error) {
      throw new Error(`Erro ao criar hospedagem: ${error.message}`);
    }
  }

  static async getAllLodgings() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela lodging não existe no banco de dados.');

      return await Lodging.findAll();
    } catch (error) {
      throw new Error(`Erro ao buscar hospedagens: ${error.message}`);
    }
  }

  static async getLodgingById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela lodging não existe no banco de dados.');

      const lodging = await Lodging.findByPk(id);
      return lodging;
    } catch (error) {
      throw new Error(`Erro ao buscar hospedagem: ${error.message}`);
    }
  }

  static async updateLodging(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela lodging não existe no banco de dados.');

      const lodging = await Lodging.findByPk(id);
      if (!lodging) return null;

      await lodging.update(updateData);
      return lodging;
    } catch (error) {
      throw new Error(`Erro ao atualizar hospedagem: ${error.message}`);
    }
  }

  static async deleteLodging(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela lodging não existe no banco de dados.');

      const lodging = await Lodging.findByPk(id);
      if (!lodging) return null;

      await lodging.destroy();
      return true;
    } catch (error) {
      throw new Error(`Erro ao deletar hospedagem: ${error.message}`);
    }
  }
}

module.exports = LodgingService;
