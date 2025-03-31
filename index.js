const http = require('http');
const os = require('os');

const server = http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end(`Adres IP: ${req.socket.localAddress}\nHostname: ${os.hostname()}\nWersja aplikacji: ${process.env.VERSION || '1.0.0'}`);
});

server.listen(8080, () => {
    console.log('Serwer działa na porcie 8080');
});
