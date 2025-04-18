const TripModel = require('../models/tripModel');

class TripService {
  static async createTrip(tripData) {
    try {
      const newTrip = await TripModel.create(tripData);
      return newTrip;
    } catch (error) {
      throw new Error(`Erro ao criar viagem: ${error.message}`);
    }
  }
  static async getAllTrips() {
    try {
      return await TripModel.findAll();
    } catch (error) {
      throw new Error(`Erro ao buscar viagens: ${error.message}`);
    }
  }
  static async getTripById(id) {
    try {
      const trip = await TripModel.findByPk(id);
      return trip;
    } catch (error) {
      throw new Error(`Erro ao buscar viagem: ${error.message}`);
    }
  }

  static async updateTrip(id, updateData) {
    try {
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
