import * as express from 'express';
import * as bodyParser from 'body-parser';
import {articlesrouter} from './pruebaRoute';

class Routes {

    public express: express.Application;

    constructor() {
        this.express = express();

        this.middleware();
        this.routes();
    }

    // Configure Express middleware.
    private middleware(): void {
        this.express.use(bodyParser.json());
        this.express.use(bodyParser.urlencoded({ extended: false }));
    }

    private routes(): void {
        this.express.use('/caso2', articlesrouter);
    }
}

export default new Routes().express;