import { WebSocketServer } from "ws";
const port = 8080;
const server = new WebSocketServer({ port: port });
server.on('connection', function connection(socket) {

    socket.send('Conneciton Successful')
    socket.on('message', function incomingMessage(message) {
        for (var client of server.clients) {
            var buffer = Buffer.from(message, "utf-8");
            var msgString = buffer.toString("UTF-8");
            client.send(msgString);
        }
        console.log("Comming Message : " + message);
    });
});