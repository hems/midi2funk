chalk    = require 'chalk'

midi     = require 'midi'

inquirer = require "inquirer"

cc_map   = require './models/cc'

# requiring our default transport, so the socket server gets initiated
transport = require './transports/socket-io.coffee'

# Set up a new input.
input = new midi.input()

# Sysex, timing, and active sensing messages are ignored
# by default. To enable these message types, pass false for
# the appropriate type in the function below.
# Order: (Sysex, Timing, Active Sensing)
# For example if you want to receive only MIDI Clock beats
# you should use 
# input.ignoreTypes(true, false, true)
input.ignoreTypes false, false, false

funktions = {}

# TODO :
# - Glob all files from "funktions" folder and cache all the requires
# - Automatically map type / message number to functions using folder structure @
# "funktions" folder

input.on "message", (deltaTime, message) ->

	type   = message[0]
	number = message[1]
	value  = message[2]

	if type is 176 # midi CC
		funktion = cc_map[number]

		if funktions[ funktion ] is undefined
			funktions[ funktion ] = require "./funktions/#{funktion}"

			console.log 'imported funktion ->', funktion

		funktion = funktions[ funktion ]

		funktion value

# Get the name of a specified input port.
console.log ' + Helloooo'

inputs = []
for index in [0..input.getPortCount()-1]
	inputs.push
		name : input.getPortName index
		value: index

# inquirer question
inquirer.prompt
	name    : 'port_index'
	default : 0
	type    : 'list'
	message : 'Please select your midi input' # select you midi input bitch
	choices : inputs
, ( answer ) ->
	input.openPort answer.port_index

	console.log " - Listening MIDI from: #{input.getPortName answer.port_index}"





# Close the port when done.
# input.closePort()

###
# ~ WE ARE NEVER DONE
###