import { connect, IRecordSet, Request } from 'mssql';
import {conexionAseni} from '../repositorio'
import { sql } from '../repositorio/conexionAseni';

export class EndPointsController {   
    private static instance: EndPointsController;

    private constructor()
    {

    }

    public static getInstance() : EndPointsController
    {
        if (!this.instance)
        {
            this.instance = new EndPointsController();
        }
        return this.instance;
    }
    
    public listEndPoint1(): Promise<any>
    {
        const pool = conexionAseni.getInstance().getConexion();
        const result  = pool.then(pool=>{
           return pool.request().query('dbo.EndPoint1').then(result=>{
               return result.recordset;
           })
        })
        .catch((err)=>{
            return "{msg: \"error\"}";
        })
        return result;
    }

    public listEndPoint5(): Promise<any>
    {
        const pool = conexionAseni.getInstance().getConexion();
        const result  = pool.then(pool=>{
           return pool.request().query('dbo.EndPoint5').then(result=>{
               return result.recordset;
           })
        })
        .catch((err)=>{
            return "{msg: \"error\"}";
        })
        return result;
    }
}