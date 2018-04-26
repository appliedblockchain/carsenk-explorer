const express = require('express')
const path = require('path')
const config = require('./config')

const app = express()

app.use(express.static(path.join(__dirname, 'app')))

const WINDOW_ENV = `window.env=${JSON.stringify(config)}\n`

app.get('/env.js', function (req, res) {
  res.set('Content-Type', 'application/javascript')
  res.send(WINDOW_ENV)
})

app.get('/*', function (req, res) {
  res.sendFile(path.join(__dirname, 'app', 'index.html'))
})

app.listen(process.env.PORT)
