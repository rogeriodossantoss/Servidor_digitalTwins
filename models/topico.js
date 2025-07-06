const { DataTypes } = require('sequelize');
const sequelize = require('../sequelize');

const Topico = sequelize.define('Topico', {
  topico: {
    type: DataTypes.STRING,
    allowNull: false
  },
  mensagem: {
    type: DataTypes.STRING,
    allowNull: false
  }
}, {
  timestamps: true
  // Sequelize criará automaticamente:
  // - id SERIAL PRIMARY KEY
  // - createdAt
  // - updatedAt
});

module.exports = Topico;
