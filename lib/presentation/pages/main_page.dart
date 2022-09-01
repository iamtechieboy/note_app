import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter demo App"),
      ),
      body: const Center(
        child: Text(
          "Hello world",
        ),
      ),
    );
  }
}
