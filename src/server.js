import expres from 'express';
import authRouter from './routes/authRoutes.js'
import shortenRouter from './routes/urlRoutes.js';
import userRoutes from './routes/userRoutes.js';

const server = expres();
server.use(expres.json());

server.use(authRouter)
server.use(shortenRouter)
server.use(userRoutes);

server.get('/status', (req, res) => {
    res.send('OK !')
});

server.listen(process.env.PORT, () => {
    console.log(`listening on port ${process.env.PORT}`)
});