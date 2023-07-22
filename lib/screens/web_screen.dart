// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../colors.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Text(
            'WhatsApp',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}
