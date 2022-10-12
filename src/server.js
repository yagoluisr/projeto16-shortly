import expres from 'express';
import authRouter from './routes/authRoutes.js'

const server = expres();
server.use(expres.json());

//Rotas de autenticação
server.use(authRouter)


server.get('/status', (req, res) => {
    res.send('OK !')
})


server.listen(5000, () => {
    console.log('listening on port 5000')
})