import * as express from 'express';
import { EndPointsController } from '../controllers'

const app = express();

app.get("/endpoint1", (req, res,next) => {
    EndPointsController.getInstance().listEndPoint1()
    .then((data)=>{
        res.json(data);
    })
    .catch((err)=>{
        return "{msg: \"error\"}";
    });

});

app.get("/endpoint5", (req, res,next) => {
    EndPointsController.getInstance().listEndPoint5()
    .then((data)=>{
        res.json(data);
    })
    .catch((err)=>{
        return "{msg: \"error\"}";
    });

});

export { app as endpointsrouter };