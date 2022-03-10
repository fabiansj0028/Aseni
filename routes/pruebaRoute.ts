import * as express from 'express';
import { ArticleController } from '../controllers'

const app = express();

app.get("/endpoint1", (req, res,next) => {
    ArticleController.getInstance().listArticles()
    .then((data)=>{
        res.json(data);
    })
    .catch((err)=>{
        return "{msg: \"error\"}";
    });

});

export { app as articlesrouter };