var NwBuilder = require('nw-builder');
var nw = new NwBuilder({
    files: './**', // use the glob format
    platforms: ['win'],
	version: '0.14.6',
	options: {
		zip: false
	}
});

// Log stuff you want
nw.on('log',  console.log);

nw.build().then(function () {
   console.log('all done!');
}).catch(function (error) {
    console.error(error);
});