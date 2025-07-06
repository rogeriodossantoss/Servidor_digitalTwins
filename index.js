const express = require('express');
const handlebars = require('express-handlebars');
const bodyParser = require('body-parser');
const mqtt = require('mqtt');
const sequelize = require('./sequelize');
const Topico = require('./models/topico');

const app = express();
const mqttClient = mqtt.connect('mqtt://192.168.1.160');
const topic = 'temperatura';

let ultimaMensagem = '';

app.engine('handlebars', handlebars.engine({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');
app.set('views', './views');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

sequelize.sync();

mqttClient.on('connect', () => {
  console.log('✅ Conectado ao broker MQTT');
  mqttClient.subscribe('#', (err) => {
    if (!err) {
      console.log(`📡 Inscrito em todos os tópicos`);
    }
  });
});

/*mqttClient.on('message', async (topic, message) => {
  const msg = message.toString();
  ultimaMensagem = msg;
  await Topico.create({ topico: topic, mensagem: msg });
});
*/
mqttClient.on('message', async (topic, message) => {
  let valor = message.toString()

  try {
    const json = JSON.parse(valor);
    if (json.msg !== undefined) valor = json.msg.toString();
  } catch (e) {
    // não Gera JSON, mantém como está
  }

  ultimaMensagem = valor;
  await Topico.create({ topico: topic, mensagem: valor });
});

app.get('/mqtt-dashboard', (req, res) => {
  res.render('mqtt', { mensagem: ultimaMensagem });
});

app.post('/enviar-mensagem', (req, res) => {
  const mensagem = req.body.mensagem;
  mqttClient.publish(topic, mensagem);
  res.redirect('/mqtt-dashboard');
});

app.get('/dashboard', async (req, res) => {
  const dados = await Topico.findAll({ order: [['createdAt', 'ASC']], limit: 100 });

  const corrente = [];
  const temperatura = [];
  const lampadas = [];

  dados.forEach(d => {
    const timestamp = d.createdAt.toISOString().slice(0, 19).replace('T', ' ');

    if (d.topico === 'corrente') {
      corrente.push({ x: timestamp, y: parseFloat(d.mensagem) * 120 });
    } else if (d.topico === 'temperatura') {
      temperatura.push({ x: timestamp, y: parseFloat(d.mensagem) });
    } else if (d.topico === 'lampadas') {
      lampadas.push({ x: timestamp, y: d.mensagem === '1' || d.mensagem.toString === 'ligado' ? 1 : 0 });
    }
  });

  console.log('Corrente:', corrente); // Verificar no console
  console.log('Temperatura:', temperatura); // Verificar no console
  console.log('Lampadas:', lampadas); // Verificar no console

  res.render('dashboard', {
    corrente: JSON.stringify(corrente),
    temperatura: JSON.stringify(temperatura),
    lampadas: JSON.stringify(lampadas)
  });
});


app.listen(3008, () => {
  console.log('🚀 Servidor rodando em http://localhost:3008');
});

//sequelize.sync({ force: true });