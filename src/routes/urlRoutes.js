import express from 'express';
import { getUrls, shorten } from '../controllers/urlController.js';
import { authToken } from '../middlewares/authTokenMiddleware.js';

const router = express.Router();

router.post('/urls/shorten', authToken, shorten);
router.get('/urls/:id', getUrls);

export default router;