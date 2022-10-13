import { connection } from '../database.js';

export async function authToken (req, res, next) {
    let token = req.headers.authorization;

    token = token.replace('Bearer ', '');
    
    const user = await connection.query(
        'SELECT * FROM sessions WHERE token = $1',[token]
    );

    if (!user.rows[0] || user.rows[0].token != token) {
        
        return res.sendStatus(401);
    }

    res.locals.user = user.rows[0];

    next();
}