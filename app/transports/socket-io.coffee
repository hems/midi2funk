handler = (req, res) ->
  fs.readFile __dirname + "/index.html", (err, data) ->
    if err
      res.writeHead 500
      return res.end("Error loading index.html")
    res.writeHead 200
    res.end data
    return

app = require("http").createServer(handler)

io = require("socket.io")(app)
fs = require("fs")

app.listen 1337

io.on "connection", (socket) ->

  socket.emit "hello",
    message: "Hello Earthling"
    data   : any_dummy_date: can_come_here: on


module.exports = ( message ) -> emit.sockets.send message