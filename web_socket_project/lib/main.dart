import 'package:flutter/material.dart';
import 'package:web_socket_project/home.dart';

void main() => runApp(const WebSocketApp());

class WebSocketApp extends StatelessWidget {
  const WebSocketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: Home());
  }
}
