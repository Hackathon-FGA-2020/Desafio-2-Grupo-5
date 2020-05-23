import Sequelize from 'sequelize';

import User from '../app/models/User';
import File from '../app/models/File';
import Receiver from '../app/models/Receiver';
import Advertising from '../app/models/Advertising';

import databaseConfig from '../config/database';

const models = [User, File, Receiver, Advertising];

class Database {
  constructor() {
    this.init();
  }

  init() {
    this.connection = new Sequelize(databaseConfig);

    models
      .map(model => model.init(this.connection))
      .map(model => model.associate && model.associate(this.connection.models));
  }
}

export default new Database();