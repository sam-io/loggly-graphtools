var http = require('http');
var coffee = require("coffee-script"); 
var fs = require('fs');

http.createServer(function (req, res) {
    
    fs.readFile('./perfstats.coffee', function(error, content) {
        res.writeHead(200, {'Content-Type': 'text/javascript'});
        res.end( coffee.compile(content.toString()) );
    });
    
}).listen(process.env.PORT);
