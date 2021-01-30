import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  static const route = '/first/pushed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert screen')),
      body: Center(
        child: Text('Hello world!'),
      ),
    );
  }
}