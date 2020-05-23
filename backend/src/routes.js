import { Router } from 'express';
import multer from 'multer';
import multerConfig from './config/multer';

import AdvertisingController from './app/controllers/AdvertisingController';
import ReceiverController from './app/controllers/ReceiverController';
import SessionController from './app/controllers/SessionController';
import UserController from './app/controllers/UserController';
import FileController from './app/controllers/FileController';


import authMiddleware from './app/middlewares/auth';

const routes = new Router();
const upload = multer(multerConfig);

// user
routes.post('/users', upload.single('file'), UserController.store);

// receiver
routes.post('/receivers', upload.single('file'), ReceiverController.store);

// session
routes.post('/login', SessionController.store);

// files
routes.post('/images', upload.single('file'), FileController.store);

routes.get('/ads', AdvertisingController.index);
routes.post('/ads', upload.single('file'), AdvertisingController.store);

/*all routes below can only be
accessed if the user is logged in*/
// routes.use(authMiddleware);

routes.put('/users', UserController.update);

// ads
routes.delete('/ads/:id', AdvertisingController.delete);

export default routes;