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
      if (!exists) throw new Error('Table trips does not exist in the database.');

      const newTrip = await TripModel.create(tripData);
      return newTrip;
    } catch (error) {
      throw new Error(`Trip creation error: ${error.message}`);
    }
  }

  static async getAllTrips() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table trips does not exist in the database.');

      return await TripModel.findAll();
    } catch (error) {
      throw new Error(`Error when searching for trips: ${error.message}`);
    }
  }

  static async getTripById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table trips does not exist in the database.');

      const trip = await TripModel.findByPk(id);
      return trip;
    } catch (error) {
      throw new Error(`Trip search error: ${error.message}`);
    }
  }

  static async updateTrip(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table trips does not exist in the database.');

      const trip = await TripModel.findByPk(id);
      if (!trip) return null;

      await trip.update(updateData);
      return trip;
    } catch (error) {
      throw new Error(`Trip update error: ${error.message}`);
    }
  }

  static async deleteTrip(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table trips does not exist in the database.');

      const trip = await TripModel.findByPk(id);
      if (!trip) return null;

      await trip.destroy();
      return true;
    } catch (error) {
      throw new Error(`Error deleting trip: ${error.message}`);
    }
  }
}

module.exports = TripService;
