import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class notify extends StatefulWidget {
  @override
  _notifyState createState() => _notifyState();
}

class _notifyState extends State<notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //IconButton(icon: Icon(Icons.send), onPressed: () {}),
        Icon(Icons.done_outline),
        Text('Doctor has been notified')
      ],
    )));
  }
}
