import 'package:flutter/material.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('cart page'),
      ),
    );
  }
}