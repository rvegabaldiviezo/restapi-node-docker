//En este archivo usamos Express para poder arrancar el servidor
const app = require('./app')

async function main(){
    await app.listen(3000);
    console.log('Server is running');
};

main();

//app.listen(3000, ()=> console.log('Server on port 3000'))