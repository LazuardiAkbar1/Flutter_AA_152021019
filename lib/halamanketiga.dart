import 'package:flutter/material.dart';

class Halamanketiga extends StatelessWidget {
  const Halamanketiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Widget'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text('Press Me'), // Provide a non-empty Text widget
          ),
        ],
      ),
    );
  }
}
