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

export async function getUrls (req, res) {
    const { id } = req.params;

    try {

        const url = await connection.query(
            'SELECT id, "shortURL", url FROM urls WHERE id = $1',[id]
        );

        if(!url.rows[0]) return res.sendStatus(404);

        res.status(200).send(url.rows[0]);
    } catch (error) {
        res.status(500).send(error.message)
    }
}