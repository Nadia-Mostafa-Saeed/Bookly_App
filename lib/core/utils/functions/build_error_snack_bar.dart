import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String errMessage) {
  return SnackBar(
    backgroundColor: Colors.white,
    content: Text(
      errMessage,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    duration: Duration(seconds: 3),
  );
}
