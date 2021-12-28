//En este archivo configuramos Express
const express = require('express');
const app =  express();

const morgan = require('morgan');
app.use(morgan('dev')); //De morgan utilizamos su metodo llamado dev: para ver mensajes cortos

app.use(require('./routes/index'));

module.exports = app;