require('dotenv').config();
const express = require('express');
const postgraphql = require('postgraphql').postgraphql

const path = require('path');
const port = process.env.PORT || 5000;
const app = express();

const username    = process.env.PG_USER_NAME
const password    = process.env.PG_USER_PASSWORD
const schema_name = process.env.SCHEMA_NAME
const db_name     = process.env.DB_NAME
const hostname    = process.env.DB_HOSTNAME
const db_port     = process.env.DB_PORT
app.use(postgraphql(
	`postgres://${username}:${password}@${hostname}:${db_port}/${db_name}`,
	schema_name,
	{ graphiql: true })
)

app.use(express.static(__dirname));

app.get('*', (req, res) => {
	res.sendFile(path.resolve(__dirname, 'index.html'))
});

app.listen(port);

console.log(process.env.SCHEMA_NAME)
console.log('!Server started, port: ' + port);
