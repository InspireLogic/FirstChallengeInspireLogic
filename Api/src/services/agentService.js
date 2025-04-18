const AgentModel = require('../models/agentModel');

class AgentService {
  static async createAgent(agentData) {
    try {
      const newAgent = await AgentModel.create(agentData);
      return newAgent;
    } catch (error) {
      throw new Error(`Erro ao criar agente: ${error.message}`);
    }
  }
  static async getAllAgents() {
    try {
      return await AgentModel.findAll();
    } catch (error) {
      throw new Error(`Erro ao buscar agentes: ${error.message}`);
    }
  }
  static async getAgentById(id) {
    try {
      const agent = await AgentModel.findByPk(id);
      return agent;
    } catch (error) {
      throw new Error(`Erro ao buscar agente: ${error.message}`);
    }
  }
  static async updateAgent(id, updateData) {
    try {
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
