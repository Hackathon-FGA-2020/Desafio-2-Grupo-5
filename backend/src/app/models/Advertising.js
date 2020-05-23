import Sequelize, { Model } from 'sequelize';

class Advertising extends Model {
  static init(sequelize) {
    super.init(
      {
        title: Sequelize.STRING,
        description: Sequelize.STRING,
        creator: Sequelize.INTEGER
      },
      {
        sequelize,
      }
    );

    return this;
  }

  static associate(models) {
    // this.belongsTo(models.User, { foreignKey: 'creator', as: 'creator_id' });
    this.belongsTo(models.File, { foreignKey: 'image', as: 'picture' });
  }

}

export default Advertising;
