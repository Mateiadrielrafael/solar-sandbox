"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require('express');
const read_1 = require("./read");
function containsAny(array, keys) {
    for (let i = 0; i < keys.length; i++) {
        if (array.indexOf(keys[i]) != -1)
            return true;
    }
    return false;
}
class Translucid {
    constructor(app) {
        this.app = app;
        this.midleware = [];
    }
    use(obj) {
        this.midleware.push(obj);
    }
    public(path = "") {
        this.app.use(`/${path}`, express.static(`/${path}`));
    }
    bind(path = "/", filepath = "", classes = []) {
        this.app.get(path, async (req, res) => {
            const readResults = await read_1.read(filepath);
            const toRun = [];
            for (let i of this.midleware) {
                if (containsAny(classes, i.keys)) {
                    toRun.push(i.run);
                }
            }
            const decorated = [];
            const expressArgs = [req, res];
            for (let i = 0; i < toRun.length; i++) {
                decorated.push((prev) => {
                    toRun[i](prev, ...expressArgs, decorated[i + 1]);
                });
            }
            decorated.push((prev) => {
                res.send(prev);
            });
            decorated[0](readResults);
        });
    }
}
exports.Translucid = Translucid;
