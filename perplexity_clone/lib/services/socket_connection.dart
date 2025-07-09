import 'dart:async';
import 'dart:convert';

import 'package:web_socket_client/web_socket_client.dart';

class SocketConnection {
  static final instance = SocketConnection._internal();
  WebSocket? _socket;

  factory SocketConnection() => instance;

  SocketConnection._internal();

  final _searchType = StreamController<Map<String, dynamic>>();
  final _searchResult = StreamController<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get searchresultType => _searchType.stream;
  Stream<Map<String, dynamic>> get searchresult => _searchResult.stream;

  void connect() {
    _socket = WebSocket(Uri.parse('ws://localhost:8000/ws/chat'));
    _socket!.messages.listen((message) {
      final data = json.decode(message);
      if (data['type'] == 'search_result') {
        _searchType.add(data);
      } else if (data['type'] == 'content') {
        _searchResult.add(data);
      }
    });
  }

  void chat(String query) {
    _socket!.send(json.encode({"query": query}));
  }
}
