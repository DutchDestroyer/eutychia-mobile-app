import 'package:flutter/material.dart';

class TestOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Choose test to perform'),
      ),
      body: const Text('Second screen'),
    );
  }
}
