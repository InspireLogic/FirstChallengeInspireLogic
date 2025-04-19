const Resort = require('../models/resortsModel');
const { sequelize } = require('../models');

class ResortService {
  static async checkTableExists() {
    const tables = await sequelize.getQueryInterface().showAllTables();
    return tables.map(t => t.toLowerCase()).includes('resorts');
  }

  static async createResort(resortData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela resorts não existe no banco de dados.');

      const newResort = await Resort.create(resortData);
      return newResort;
    } catch (error) {
      throw new Error(`Erro ao criar resort: ${error.message}`);
    }
  }

  static async getAllResorts() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela resorts não existe no banco de dados.');

      return await Resort.findAll();
    } catch (error) {
      throw new Error(`Erro ao buscar resorts: ${error.message}`);
    }
  }

  static async getResortById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela resorts não existe no banco de dados.');

      const resort = await Resort.findByPk(id);
      return resort;
    } catch (error) {
      throw new Error(`Erro ao buscar resort: ${error.message}`);
    }
  }

  static async updateResort(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela resorts não existe no banco de dados.');

      const resort = await Resort.findByPk(id);
      if (!resort) return null;

      await resort.update(updateData);
      return resort;
    } catch (error) {
      throw new Error(`Erro ao atualizar resort: ${error.message}`);
    }
  }

  static async deleteResort(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela resorts não existe no banco de dados.');

      const resort = await Resort.findByPk(id);
      if (!resort) return null;

      await resort.destroy();
      return true;
    } catch (error) {
      throw new Error(`Erro ao deletar resort: ${error.message}`);
    }
  }
}

module.exports = ResortService;
