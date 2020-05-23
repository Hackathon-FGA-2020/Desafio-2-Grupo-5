module.exports = {
  dialect: 'postgres',
  host: 'localhost',
  username: 'postgres',
  password: 'docker',
  database: 'donations',
  define: {
    timestamps: true,
    underscored: true,
    underscoredAll: true,
  },
};
