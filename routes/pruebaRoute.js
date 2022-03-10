"use strict";
exports.__esModule = true;
exports.articlesrouter = void 0;
var express = require("express");
var controllers_1 = require("../controllers");
var app = express();
exports.articlesrouter = app;
app.get("/prueba", function (req, res, next) {
    controllers_1.ArticleController.getInstance().listArticles()
        .then(function (data) {
        res.json(data);
    })["catch"](function (err) {
        return "{msg: \"error\"}";
    });
});
