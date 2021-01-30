/* */
import 'package:flutter/material.dart';

/* */
import 'package:flutter_app/providers/navigation.dart';

class LikeScreen extends StatelessWidget {
  static const route = '/like';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),
    );
  }
}