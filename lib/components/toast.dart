

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message}){

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red[900],
    textColor: Colors.white,
    fontSize: 16

  );
}