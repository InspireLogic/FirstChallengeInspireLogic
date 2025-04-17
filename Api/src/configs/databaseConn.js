const handleDatabaseErro = require('./handleErro');
const crendentialsDB = require('./crendentialsDB');

const databaseConn = async() => {
    let conn;
    try{
        conn = await crendentialsDB;
        return conn;
    }catch(erro){
        handleDatabaseErro(erro);
        throw erro;
    }finally{
        if(conn) await conn.end(); // observar pq ela pode finalizar antes de consultar
    }
}
databaseConn()
module.exports = databaseConn;