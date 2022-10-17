import { connection } from '../database.js';


export async function getUserDate (req, res) {
    const user = res.locals.user;
    try {

        const userDate = await connection.query(
            'SELECT users.id, users.name, COUNT("userId") AS "visitCount" FROM urls JOIN "accessUrl" ON "accessUrl"."urlId" = urls.id JOIN users ON users.id = urls."userId" WHERE users.id = $1 GROUP By users.id;', [user.userId]
        );

        const shortenedUrls = await connection.query(
            'SELECT urls.id, urls."shortUrl", urls."URL", COUNT("userId") AS "visitCount" FROM urls JOIN "accessUrl" ON urls.id = "urlId" WHERE urls."userId" = $1 GROUP BY urls.id;', [user.userId]
        );
        
        res.status(200).send({
            ...userDate.rows[0],
            shortenedUrls: shortenedUrls.rows
        });
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function ranking (req, res) {
    try {
        const ranking = await connection.query(
            `SELECT 
                "userId" AS id,
                a.name,
                "linkCount",
                "visitCount"
             FROM 
                (SELECT 
                    users.id AS "userId", 
                    users.name, 
                    COUNT("userId") AS "linkCount" 
                FROM users 
                LEFT JOIN urls 
                    ON users.id = urls."userId" 
                    GROUP BY users.id) AS a 
            LEFT JOIN 
                (SELECT 
                    users.id,
                    COUNT(urls."userId") AS "visitCount" 
                FROM users 
                    LEFT JOIN urls 
                ON users.id = urls."userId"
                    LEFT JOIN "accessUrl" 
                ON "accessUrl"."urlId" = urls.id 
                    GROUP By users.id) AS b 
            ON a."userId" = b.id 
                ORDER BY "visitCount" 
                DESC 
                LIMIT 10;
            `
        );

        res.status(200).send(ranking.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

