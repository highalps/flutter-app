import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AndroidTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: TabBarView(
          children: [
            Text('Home'),
            Text('Image')
          ]
        ),

    )
  }
}