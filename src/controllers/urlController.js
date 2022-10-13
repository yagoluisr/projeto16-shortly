import { connection } from '../database.js';
import { nanoid } from 'nanoid';

export async function shorten (req, res) { 
    const { url } = req.body;
    const user = res.locals.user;

    if(!url){
        return res.sendStatus(401)
    }
    
    try {
        let isURL = new URL(url);
    } catch(err) {
        res.status(422).send('URL inválida !')
    }

    let shortUrl = url
    shortUrl = nanoid();

    try {
        await connection.query(
            'INSERT INTO urls ("userId", url, "shortURL") VALUES ($1,$2,$3);',[user.id, url, shortUrl]
        );

        res.status(201).send({shortUrl})
    } catch (error) {
        res.status(500).send(error.message)
    }
}

