import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textController = TextEditingController();
  final webSocketChannel = WebSocketChannel.connect(
      Uri.parse('your-url')); // You should add your url
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Socket'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
                child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(label: Text('Send Message')),
            )),
          ),
          Expanded(
              flex: 8,
              child: StreamBuilder(
                  stream: webSocketChannel.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      messages.add(snapshot.data.toString());
                    }
                    return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.mail),
                            title: Text(messages[index]),
                          );
                        });
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Icon(Icons.send),
          onPressed: () {
            webSocketChannel.sink.add(textController.text);
            textController.text = '';
          }),
    );
  }
}
