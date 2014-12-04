Simple midi to javascript ( actually [coffee-script](http://coffeescript.org/) ) function mapper.

## install instructions

````
npm install
````

then

````
make start
````

or

````
./node_modules/.bin/coffee app/start.cofee
````
## how to use it

Once you run it and choose your midi device it will create a server at [localhost:1337](http://localhost:1337)  

Then add socket.io to your html file ( generally your index file? )
````
<script src="http://localhost:1337/socket.io/socket.io.js"></script>
````

At the moment there is a very simple and just broadcast the deltaTime / midi message via socket.io, in short you can retrieve them with
````
socket = io.connect('http://localhost:1337')
socket.on 'message', ( data ) =>

	message = data.message

	type   = message[0]
	number = message[1]
	value  = message[2]
````

Shold be very easy to change the transport ( socket.io ) to something else

## get in touch!

 - If you feel interested by this project and want to develop this further
 - have some nice ideas 
 - want to chat about it
 - want me to come over and have a geeky session  

just drop me a line: ````hems.inlet+gh@gmail.com````

````
$ happy patching
````

## thanks to :  
 * [coffee-script](http://coffeescript.org/)  
 ~ It gives me nightmares just to think how life could be without you

 * [node-midi](https://github.com/justinlatimer/node-midi)  
 ~ without you this wouldn't be possible wire this all in less than 10 minutes 

 * [inquirer](https://www.npmjs.org/package/inquirer)  
 ~ that awesome module to do awesome prompts on the command line  

 * [Dave Smith](http://www.davesmithinstruments.com/)  
 ~ For making something so good 30 years ago ( MIDI )

 * [socket.io](http://socket.io/)  
 ~ You guys have done a great work!

## unthanks to :  

 * [Dave Smith](http://www.davesmithinstruments.com/)  
 ~ For doing posh synths and not fucking about doing a new implementation of
 midi that works in modern days and then convincing everyone to swap and also
 for not sending me any of those posh synths that i won't probably afford to
 buy for the next good few years

 * [socket.io](http://socket.io/)  
 ~ For releasing 1.0 with loads of bugs