emit = require '../transports/socket-io'
emit = emit.sockets.send

module.exports = ( value ) ->


	console.log "value is ->", value


	emit 'some-value', value