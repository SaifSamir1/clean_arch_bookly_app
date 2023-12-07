import 'package:flutter/material.dart';

Future<void> buildFutureDelayedFunction({required VoidCallback? function,required Duration duration}) {
  return Future.delayed(duration,function);
}