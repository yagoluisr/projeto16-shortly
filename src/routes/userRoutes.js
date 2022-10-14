import express from 'express';
import { getUserDate } from '../controllers/userController.js';
import { authToken } from '../middlewares/authTokenMiddleware.js';

const router = express.Router();

router.use('/users/me', authToken, getUserDate)

export default router;