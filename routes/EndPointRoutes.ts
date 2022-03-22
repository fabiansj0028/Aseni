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

app.get("/endpoint2", (req, res,next) => {
    EndPointsController.getInstance().listEndPoint2(req.query.accion.toString())
    .then((data)=>{
        res.json(data);
    })
    .catch((err)=>{
        return "{msg: \"error\"}";
    });

});

app.get("/endpoint3", (req, res,next) => {
    EndPointsController.getInstance().listEndPoint3(req.query.palabras.toString())
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

app.get("/endpoint6", (req, res,next) => {
    EndPointsController.getInstance().listEndPoint6(req.query.IdCiudadano.toString(),
                                                    req.query.IdPlan.toString(),
                                                    req.query.ListEntreg.toString(),
                                                    req.query.ListCalif.toString())
    .then((data)=>{
        res.json(data);
    })
    .catch((err)=>{
        return "{msg: \"error\"}";
    });

});

export { app as endpointsrouter };