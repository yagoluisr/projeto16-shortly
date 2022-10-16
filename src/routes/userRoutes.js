import express from 'express';
import { getUserDate, ranking } from '../controllers/userController.js';
import { authToken } from '../middlewares/authTokenMiddleware.js';

const router = express.Router();

router.get('/users/me', authToken, getUserDate);
router.get('/ranking', ranking);

export default router;