const RegionsModel = require('../models/regionsModel');

class RegionService {
  static async createRegion(regionData) {
    try {
      const newRegion = await RegionsModel.create(regionData);
      return newRegion;
    } catch (error) {
      throw new Error(`Erro ao criar região: ${error.message}`);
    }
  }
  static async getAllRegions() {
    try {
      return await RegionsModel.findAll();
    } catch (error) {
      throw new Error(`Erro ao buscar regiões: ${error.message}`);
    }
  }
  static async getRegionById(id) {
    try {
      const region = await RegionsModel.findByPk(id);
      return region;
    } catch (error) {
      throw new Error(`Erro ao buscar região: ${error.message}`);
    }
  }
  static async updateRegion(id, updateData) {
    try {
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
