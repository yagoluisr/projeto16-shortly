import express from 'express';
import { acessUrl, deleteUrl, getUrls, shorten } from '../controllers/urlController.js';
import { authToken } from '../middlewares/authTokenMiddleware.js';

const router = express.Router();

router.post('/urls/shorten', authToken, shorten);
router.get('/urls/:id', getUrls);
router.get('/urls/open/:shortUrl', acessUrl);
router.delete('/urls/:id', authToken, deleteUrl);

export default router;