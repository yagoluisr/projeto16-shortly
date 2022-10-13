import express from 'express';
import { shorten } from '../controllers/urlController.js';
import { authToken } from '../middlewares/authTokenMiddleware.js';

const router = express.Router();

router.post('/urls/shorten', authToken, shorten)

export default router;