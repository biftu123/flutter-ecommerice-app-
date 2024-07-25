import 'package:flutter/material.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('search page'),
      centerTitle: true,),
      body:const Center(
        child: Text("search page"),
      )
    );
  }
}