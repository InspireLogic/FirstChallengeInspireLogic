const TripModel = require('../models/tripModel');
const { sequelize } = require('../models');

class TripService {
  static async checkTableExists() {
    const tables = await sequelize.getQueryInterface().showAllTables();
    return tables.map(t => t.toLowerCase()).includes('trips');
  }

  static async createTrip(tripData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela trips não existe no banco de dados.');

      const newTrip = await TripModel.create(tripData);
      return newTrip;
    } catch (error) {
      throw new Error(`Erro ao criar viagem: ${error.message}`);
    }
  }

  static async getAllTrips() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela trips não existe no banco de dados.');

      return await TripModel.findAll();
    } catch (error) {
      throw new Error(`Erro ao buscar viagens: ${error.message}`);
    }
  }

  static async getTripById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela trips não existe no banco de dados.');

      const trip = await TripModel.findByPk(id);
      return trip;
    } catch (error) {
      throw new Error(`Erro ao buscar viagem: ${error.message}`);
    }
  }

  static async updateTrip(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela trips não existe no banco de dados.');

      const trip = await TripModel.findByPk(id);
      if (!trip) return null;

      await trip.update(updateData);
      return trip;
    } catch (error) {
      throw new Error(`Erro ao atualizar viagem: ${error.message}`);
    }
  }

  static async deleteTrip(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela trips não existe no banco de dados.');

      const trip = await TripModel.findByPk(id);
      if (!trip) return null;

      await trip.destroy();
      return true;
    } catch (error) {
      throw new Error(`Erro ao deletar viagem: ${error.message}`);
    }
  }
}

module.exports = TripService;
