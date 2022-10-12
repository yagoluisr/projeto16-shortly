import { connection } from '../database.js';
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';


export async function signup (req, res) {
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