import express from 'express';
import { signup } from '../controllers/authController.js';
import { authSignup } from '../middlewares/authMiddlewares.js';

const router = express.Router();


router.post('/signup', authSignup, signup)

export default router;