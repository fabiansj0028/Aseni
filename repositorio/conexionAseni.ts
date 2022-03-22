import * as sql from "mssql";

export class conexionAseni{

  private static instance : conexionAseni;

  private pool : sql.ConnectionPool;

  private dbSettings ={
    user:'sa',
    password: '1234',
    server: 'localhost',
    database: 'Aseni',
    pool: {
      max:4,
      min:0,

    },
    options:{
        encrypt: true,
        trustServerCertificate: true
    }
  };

  private constructor(){
    this.pool= new sql.ConnectionPool(this.dbSettings);
  }

  public static getInstance(){
    if(!this.instance){
      this.instance = new conexionAseni();
    }
    return this.instance;
  }

  public getConexion(): Promise<any>
  {
    
    return this.pool.connect().then(pool=>{
      if (pool.connected){
        return pool;
      }
    })
    .catch((err)=>{
      return "{msg: \"error\"}";
    });
  }
}
  
export {sql}