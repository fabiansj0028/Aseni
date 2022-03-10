import * as sql from "mssql";

export class conexion{

  private static instance : conexion;

  private dbSettings ={
    user:'sa',
    password: '1234',
    server: 'localhost',
    database: 'Aseni',
    options:{
        encrypt: true,
        trustServerCertificate: true
    }
  };

  private constructor(){
  }

  public static getInstance(){
    if(!this.instance){
      this.instance = new conexion();
    }
    return this.instance;
  }

  public async getConexion(){
   const pool = await sql.connect(this.dbSettings)
   return pool;
  }
}
  
export {sql}