





import 'package:flutter/material.dart';


SnackBar buildErrorSnackBar(String errorMessage) {
  return SnackBar(
    backgroundColor: Colors.grey,
    content: Text(
      errorMessage,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
    duration:
    const Duration(seconds: 3), // You can customize the duration
  );
}
