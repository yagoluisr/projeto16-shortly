import express from 'express';
import { signIn, signUp } from '../controllers/authController.js';
import { authSignin, authSignup } from '../middlewares/authMiddlewares.js';

const router = express.Router();


router.post('/signup', authSignup, signUp)
router.post('/signin',authSignin, signIn)

export default router;