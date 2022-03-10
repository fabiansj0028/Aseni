import {conexion} from '../repositorio'

export class ArticleController {   
    private static instance: ArticleController;

    private constructor()
    {

    }

    public static getInstance() : ArticleController
    {
        if (!this.instance)
        {
            this.instance = new ArticleController();
        }
        return this.instance;
    }

    public async listArticles()
    {
        const pool = conexion.getInstance().getConexion();
        const result  = (await pool).request().query('dbo.getEntregables 1')
        return (await result).recordset;
    }
}