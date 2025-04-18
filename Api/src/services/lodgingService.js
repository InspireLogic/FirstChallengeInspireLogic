const Lodging = require('../models/modelLodging');

class LodgingService {
  static async createLodging(lodgingData) {
    try {
      const newLodging = await Lodging.create(lodgingData);
      return newLodging;
    } catch (error) {
      throw new Error(`Erro ao criar hospedagem: ${error.message}`);
    }
  }
  static async getAllLodgings() {
    try {
      return await Lodging.findAll();
    } catch (error) {
      throw new Error(`Erro ao buscar hospedagens: ${error.message}`);
    }
  }
  static async getLodgingById(id) {
    try {
      const lodging = await Lodging.findByPk(id);
      return lodging;
    } catch (error) {
      throw new Error(`Erro ao buscar hospedagem: ${error.message}`);
    }
  }
  static async updateLodging(id, updateData) {
    try {
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
