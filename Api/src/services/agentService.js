const AgentModel = require('../models/agentModel');
const { sequelize } = require('../models'); 

class AgentService {
  static async checkTableExists() {
    const tables = await sequelize.getQueryInterface().showAllTables();
    return tables.map(t => t.toLowerCase()).includes('agents');
  }

  static async createAgent(agentData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('TTable agents does not exist in the database.');

      const newAgent = await AgentModel.create(agentData);
      return newAgent;
    } catch (error) {
      throw new Error(`Error creating agent: ${error.message}`);
    }
  }

  static async getAllAgents() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table agents does not exist in the database.');

      return await AgentModel.findAll();
    } catch (error) {
      throw new Error(`Error when searching for agents: ${error.message}`);
    }
  }

  static async getAgentById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table agents does not exist in the database.');

      const agent = await AgentModel.findByPk(id);
      return agent;
    } catch (error) {
      throw new Error(`Agent search error: ${error.message}`);
    }
  }

  static async updateAgent(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table agents does not exist in the database.');

      const agent = await AgentModel.findByPk(id);
      if (!agent) return null;

      await agent.update(updateData);
      return agent;
    } catch (error) {
      throw new Error(`Error updating agent: ${error.message}`);
    }
  }

  static async deleteAgent(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Table agents does not exist in the database.');

      const agent = await AgentModel.findByPk(id);
      if (!agent) return null;

      await agent.destroy();
      return true;
    } catch (error) {
      throw new Error(`Error deleting agent: ${error.message}`);
    }
  }
}

module.exports = AgentService;
