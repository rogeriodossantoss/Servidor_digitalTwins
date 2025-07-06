const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('Sistema', 'postgres', 'Manaus@123', {
  host: 'localhost',
  dialect: 'postgres'
});

module.exports = sequelize;
