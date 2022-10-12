import expres from 'express';
import { connection } from './database.js';
import bcrypt from 'bcrypt';
import joi from 'joi';
import { v4 as uuid } from 'uuid';

const server = expres();

server.use(expres.json());

const authSchema = joi.object({
    name: joi.string().required(),
    email: joi.string().email().required(),
    password: joi.string().required(),
    confirmPassword: joi.string().required()
});


server.post('/signup', async (req, res) => {
    const { name, email, password, confirmPassword } = req.body;

    try {

        const validation = authSchema.validate({name, email, password, confirmPassword}, {abortEarly: false});

        if(validation.error){
            const error = validation.error.details.map(err => err.message);
            return res.status(422).send(error)
        }

        const hasEmail = await connection.query(
            'SELECT * FROM users WHERE email = $1', [email]
        );

        if(hasEmail.rows[0]) return res.sendStatus(409);

        if(password != confirmPassword) return res.status(404).send('As senhas não conferem');

        const passwordHash = bcrypt.hashSync(password,10);

        await connection.query(
            'INSERT INTO users (name, email, password) VALUES ($1,$2,$3);', [name, email, passwordHash]
        );

        res.sendStatus(201);
    } catch (error) {
        res.status(500).send(error.message);
    }
})


server.get('/status', (req, res) => {
    res.send('OK !')
})


server.listen(5000, () => {
    console.log('listening on port 5000')
})