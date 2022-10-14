import { connection } from '../database.js';


export async function getUserDate (req, res) {
    try {

        const userDate = await connection.query(
            'SELECT users.id, users.name, COUNT("userId") AS "visitCount" FROM urls JOIN "accessUrl" ON "accessUrl"."urlId" = urls.id JOIN users ON users.id = urls."userId" GROUP By users.id;'
        );

        const shortenedUrls = await connection.query(
            'SELECT urls.id, urls."shortUrl", urls."URL", COUNT("userId") AS "visitCount" FROM urls JOIN "accessUrl" ON urls.id = "urlId" GROUP BY urls.id;'
        );
        
        res.status(200).send({
            ...userDate.rows[0],
            shortenedUrls: shortenedUrls.rows
        });
    } catch (error) {
        res.status(500).send(error.message);
    }
}

