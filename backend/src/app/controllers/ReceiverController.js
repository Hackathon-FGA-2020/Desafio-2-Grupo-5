import * as Yup from 'yup';
import Receiver from '../models/Receiver';
import File from '../models/File';

class ReceiverController {
  async store(req, res) {
    const data = req.body;

    const schema = Yup.object().shape({
      name: Yup.string().required(),
      email: Yup.string()
        .email()
        .required(),
      password: Yup.string().min(6),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation not accepted' });
    }

    const userExists = await Receiver.findOne({ where: { email: req.body.email } });
    if (userExists) {
      return res.status(400).json({ error: 'Reciver already exists!' });
    }

    const { originalname: name, filename: path } = req.file;
    const file = await File.create({
      name,
      path,
    });

    const resReciver = await Receiver.create({ ...data, avatar_id: file.id });

    return res.json({
      id: resReciver.id,
      name: resReciver.name,
      email: resReciver.email,
    });
  }

  async update(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string(),
      email: Yup.string().email(),
      password: Yup.string().min(6),
      oldPassword: Yup.string()
        .min(6)
        .when('password', (password, field) =>
          password ? field.required() : field
        ),
      confirmPassword: Yup.string()
        .min(6)
        .when('password', (password, field) =>
          password ? field.required().oneOf([Yup.ref('password')]) : field
        ),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation not accepted' });
    }

    const { email, oldPassword } = req.body;

    const user = await Reciver.findByPk(req.userId);

    if (email && email !== user.email) {
      const userExists = await Reciver.findOne({ where: { email } });
      if (userExists) {
        return res.status(400).json({ error: 'Email is already in use' });
      }
    }

    if (oldPassword && !(await user.checkPassword(oldPassword))) {
      return res.status(401).json({ error: 'Password does not match' });
    }

    const { id, name } = await user.update(req.body);

    return res.json({ id, name, email });
  }
}

export default new ReceiverController();
