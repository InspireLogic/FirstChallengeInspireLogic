const PasseModel = require('./../models/passeModel');
// const utils = require('./utils');// off
class PasseService{
    static async createPasse(passeData){
        try{
            return await PasseModel.create(passeData);
        }catch (error){
            throw new Error(`Erro to create pass: ${error.message}`);
        }
    }
    static async getAllPasses(){
        try{
            return await PasseModel.findAll();
        }catch (error){
            throw new Error(`Erro to getAll pass: ${error.message}`);
        }
    }
    static async getPassById(id){
        try{
            return await PasseModel.findByPk(id);
        }catch (error){
            throw new Error(`Error to getPassById: ${error.message}`)
        }
    }
    static async updatePasse(id, updateData){
        try{
            const pass = await  PasseModel.findByPk(id);
            await pass.update(updateData);
            console.log(await pass.update(updateData));
        }catch (error){
            throw new Error(`Error to updatePasse: ${error.message}`)
        }
    }
    static async deletePasses(id){
        try{
            const pass = await PasseModel.findByPk(id);
            if(!pass) return false;
            await pass.destroy();
            return true;
        }catch (error){
            throw new Error(`Error to delete: ${error.message}`)
        }
    }
}
(async ()=>{
    const teste = await PasseService.getAllPasses();
    teste.map(r=>console.log(r.dataValues.id))
})();
module.exports = PasseService;