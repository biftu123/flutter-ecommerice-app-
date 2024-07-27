import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';

class allnearresturant extends StatelessWidget {
  const allnearresturant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('catagories',style: TextStyle(fontSize: 16,color: kgray,fontWeight: FontWeight.normal),),
        centerTitle: true,
        elevation: 0,
      ),
      body:const Center(
        child: Text('catagories',style: TextStyle(fontSize: 16,color: kgray,fontWeight: FontWeight.normal),),
      ),
    );
  }
}