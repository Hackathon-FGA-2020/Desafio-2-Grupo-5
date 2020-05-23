import * as Yup from 'yup';
import User from '../models/User';
import Advertising from '../models/Advertising';
import File from '../models/File';

class AdvertisingController {

  async index(req, res) {
    const ads = await Advertising.findAll({
      where: { active: true },
      include: [
        {
          model: File,
          // attributes: ['path', 'name'],
          as: 'picture'
        },
      ],
      attributes: [
        'id',
        'title',
        'description'
      ],
    });
    return res.json(ads);
  }

  async store(req, res) {
    const { title, description, creator } = req.body;

    const schema = Yup.object().shape({
      title: Yup.string().required(),
      description: Yup.string().required(),
      creator: Yup.number().required()
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation fail' });
    }

    const { originalname: name, filename: path } = req.file;
    const file = await File.create({
      name,
      path,
    });

    const image_id = file.id
    console.log(image_id)

    const data = {
      title,
      description,
      creator,
      image: file.id.toString()
    }
    console.log(data)

    const resAds = await Advertising.create(data);

    return res.json(
      {
        title: resAds.title,
        description: resAds.description,
        creator: resAds.creator
      }
    );
  }

  async delete(req, res) {
    const { id } = req.params;

    const adsExists = await Advertising.findByPk(id);

    if (!adsExists) {
      return res.status(400).json({ error: 'Advertising does not exists!' });
    }

    await Advertising.destroy({ where: { id } });

    return res.status(200).json();
  }
}

export default new AdvertisingController();
