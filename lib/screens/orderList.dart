/* */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OrderListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주문 내역', style: TextStyle(fontSize: 14)),
        centerTitle: true,
        elevation: 6,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.flip_to_back,
              color: Colors.black87
            ),
            onPressed: () {}
          )
        ],
      )
    );
  }
}