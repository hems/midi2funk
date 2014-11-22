emit = require '../transports/socket-io'

module.exports = ( value ) ->


	# console.log "value is ->", value


	emit 'some-value', value