import { connection } from '../database.js';

export async function shorten (req, res) { 
    const token = res.locals.token;
    console.log(token)
    try {

        res.send('OK')
    } catch (error) {
        res.status(500).send(error.message)
    }
}