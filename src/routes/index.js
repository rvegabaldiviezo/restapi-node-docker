//En este archivo vamos a indicar las rutas 
const {Router} = require('express');//Metodo Router me permite poder crear rutas
const router = Router();//Me devuelve un Objeto

//Atraves del metodo router voy a crear una ruta inicial
router.get('/', (req, res) => res.json({mensaje: 'todo ok'}))

module.exports = router;
