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
    shortUrl = nanoid(8);

    try {
        await connection.query(
            'INSERT INTO urls ("userId", "URL", "shortUrl") VALUES ($1,$2,$3);',[user.id, url, shortUrl]
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
            'SELECT id, "shortUrl", "URL" FROM urls WHERE id = $1',[id]
        );

        if(!url.rows[0]) return res.sendStatus(404);

        res.status(200).send(url.rows[0]);
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function acessUrl (req, res) {
    const { shortUrl } = req.params;

    try {
        const hasShortUrl = await connection.query(
            'SELECT * FROM urls WHERE "shortUrl" = $1',[shortUrl]
        );

        if(!hasShortUrl.rows[0]) return res.sendStatus(404);

        await connection.query(
            'INSERT INTO "accessUrl" ("urlId") VALUES ($1);',[hasShortUrl.rows[0].id]
        );

        res.redirect(hasShortUrl.rows[0].URL);
    } catch (error) {
        res.status(500).send(error.message)
    }
}

export async function deleteUrl (req, res) {
    const { id } = req.params;
    const userSessions = res.locals.user;

    try {
        const url = await connection.query(
            'SELECT * FROM urls WHERE id = $1', [id]
        );

        if(!url.rows[0]) return res.sendStatus(404);

        if(userSessions.userId != url.rows[0].userId) return res.sendStatus(401);

        await connection.query(
            'DELETE FROM "accessUrl" WHERE "urlId" = $1;',[id]
        );

        await connection.query(
            'DELETE FROM urls WHERE id = $1',[id]
        );

        res.sendStatus(204);
    } catch (error) {
        res.status(500).send(error.message);
    }
}