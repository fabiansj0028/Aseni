"use strict";
exports.__esModule = true;
var express = require("express");
var bodyParser = require("body-parser");
var pruebaRoute_1 = require("./pruebaRoute");
var Routes = /** @class */ (function () {
    function Routes() {
        this.express = express();
        this.middleware();
        this.routes();
    }
    // Configure Express middleware.
    Routes.prototype.middleware = function () {
        this.express.use(bodyParser.json());
        this.express.use(bodyParser.urlencoded({ extended: false }));
    };
    Routes.prototype.routes = function () {
        this.express.use('/articles', pruebaRoute_1.articlesrouter);
    };
    return Routes;
}());
exports["default"] = new Routes().express;
