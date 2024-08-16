
import 'package:flutter/material.dart';
import 'package:foodorder/model/othermodels/allresturantmodel.dart';

class Resturanthook {
  final Allrestuantmodel? data;
  final bool isloading;
  final Exception? error;
  final VoidCallback? refetch;
  Resturanthook({
    required this.data,
    required this.isloading,
   required this.error,
   required this.refetch,
  });
}
