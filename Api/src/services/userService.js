const User = require('../models/UserModel');
const { sequelize } = require('../models');

class UserService {
  static async checkTableExists() {
    const tables = await sequelize.getQueryInterface().showAllTables();
    return tables.map(t => t.toLowerCase()).includes('users');
  }

  static async createUser(userData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table users does not exist in the database.');

      const newUser = await User.create(userData);
      return newUser;
    } catch (error) {
      throw new Error(`Error creating user: ${error.message}`);
    }
  }

  static async getAllUsers() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table users does not exist in the database.');

      return await User.findAll();
    } catch (error) {
      throw new Error(`Error when searching for users: ${error.message}`);
    }
  }

  static async getUserById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table users does not exist in the database.');

      const user = await User.findByPk(id);
      return user;
    } catch (error) {
      throw new Error(`User search error: ${error.message}`);
    }
  }

  static async updateUser(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table users does not exist in the database.');

      const user = await User.findByPk(id);
      if (!user) return null;

      await user.update(updateData);
      return user;
    } catch (error) {
      throw new Error(`Error updating user: ${error.message}`);
    }
  }

  static async deleteUser(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table users does not exist in the database.');

      const user = await User.findByPk(id);
      if (!user) return null;

      await user.destroy();
      return true;
    } catch (error) {
      throw new Error(`Error when deleting user: ${error.message}`);
    }
  }
}

module.exports = UserService;
