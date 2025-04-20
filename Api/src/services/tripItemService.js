const TripItemModel = require('./../models/tripItemModel');

class TripItemService{
    static async createTripItem(tripIntemData){
        try{
            const tripItem = await TripItemModel.create(tripIntemData);
            return tripItem? tripItem: 'error to create tripItem';
        }catch (error){
            throw new Error(`Erro to create: ${error.message}`);
        }
    };
    static async getAllTripItem(){
        try{
            return await TripItemModel.findAll();
        }catch (error){
            throw new Error(`Erro getAllTripItems: ${error.message}`);
        }
    };
    static async getTripItemById(id){
        try{
            const tripItem = await TripItemModel.findByPk(id);
            if(!tripItem) throw new Error('Erro id Not found');
            return tripItem;
        }catch (error){
            throw new Error(`Id TripItemById not found: ${error.message}`)
        }
    };
    static async updateTripItem(id,tripItemData){
        try{
            const tripItem = await TripItemModel.findByPk(id);
            if(!tripItem) throw new Error("id not found");
            return await tripItem.update(tripItemData);
        }catch(error){
            throw new Error(`Error updateTripItem: ${error.message}`);
        }
    };
    static async deleteTripItem(id){
        try{
            const tripItem = await TripItemModel.findByPk(id);
            if(!tripItem) throw new Error("Error id not found");
            await tripItem.destroy();
            return true;
        }catch(error){
            throw new Error(`Erro deleteTripItem: ${error.message}`);
        }
    };
}
module.exports = TripItemService;