import { connection } from '../database.js';
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';


export async function signUp (req, res) {
    const { name, email, password, confirmPassword } = res.locals.user;

    try {
        const passwordHash = bcrypt.hashSync(password,10);

        await connection.query(
            'INSERT INTO users (name, email, password) VALUES ($1,$2,$3);', [name, email, passwordHash]
        );

        res.sendStatus(201);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function signIn (req, res) {
    const { email, password } = res.locals.user;

    try {

    const user = await connection.query(
        'SELECT * FROM users WHERE email = $1', [email]
    );

    if(!user.rows[0]) return res.sendStatus(401);
        
    console.log(user.rows[0].password)
    if (user.rows[0] && bcrypt.compareSync(password, user.rows[0].password)) {
        const token = uuid();
        await connection.query(
            'INSERT INTO sessions ("userId", token) VALUES ($1,$2);', [user.rows[0].id, token]
        )
        return res.status(200).send({token});
    }
        res.sendStatus(404);
    } catch (error) {
        res.status(500).send(error.message);
    }
}