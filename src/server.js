import expres from 'express';
import authRouter from './routes/authRoutes.js'
import shortenRouter from './routes/urlRoutes.js';

const server = expres();
server.use(expres.json());

//Rotas de autenticação
server.use(authRouter)

//Rotas de URL
server.use(shortenRouter)


server.get('/status', (req, res) => {
    res.send('OK !')
})


server.listen(5000, () => {
    console.log('listening on port 5000')
})