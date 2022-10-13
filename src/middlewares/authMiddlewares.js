import joi from 'joi';
import { connection } from '../database.js';
import bcrypt from 'bcrypt';


const authSchema = joi.object({
    name: joi.string().required(),
    email: joi.string().email().required(),
    password: joi.string().required(),
    confirmPassword: joi.string().required()
});

const authSigninSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().required()
});


export async function authSignup (req, res, next) {
    const { name, email, password, confirmPassword } = req.body;

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

    res.locals.user = { name, email, password, confirmPassword }

    next()
}

export async function authSignin (req, res, next) {
    const { email, password } = req.body;

    const validation = authSigninSchema.validate({ email, password}, {abortEarly: false});

    if(validation.error){
        const error = validation.error.details.map(err => err.message);
        return res.status(422).send(error)
    }

    res.locals.user = { email, password }

    next()
}


