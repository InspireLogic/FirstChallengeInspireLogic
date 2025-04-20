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
      if (!exists) throw new Error('Tabela agents não existe no banco de dados.');

      const newAgent = await AgentModel.create(agentData);
      return newAgent;
    } catch (error) {
      throw new Error(`Erro ao criar agente: ${error.message}`);
    }
  }

  static async getAllAgents() {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela agents não existe no banco de dados.');
      return await AgentModel.findAll();
    } catch (error) {
      throw new Error(`Erro ao buscar agentes: ${error.message}`);
    }
  }

  static async getAgentById(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela agents não existe no banco de dados.');

      const agent = await AgentModel.findByPk(id);
      return agent;
    } catch (error) {
      throw new Error(`Erro ao buscar agente: ${error.message}`);
    }
  }

  static async updateAgent(id, updateData) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela agents não existe no banco de dados.');

      const agent = await AgentModel.findByPk(id);
      if (!agent) return null;

      await agent.update(updateData);
      return agent;
    } catch (error) {
      throw new Error(`Erro ao atualizar agente: ${error.message}`);
    }
  }

  static async deleteAgent(id) {
    try {
      const exists = await this.checkTableExists();
      if (!exists) throw new Error('Tabela agents não existe no banco de dados.');

      const agent = await AgentModel.findByPk(id);
      if (!agent) return null;

      await agent.destroy();
      return true;
    } catch (error) {
      throw new Error(`Erro ao deletar agente: ${error.message}`);
    }
  }
}

module.exports = AgentService;
