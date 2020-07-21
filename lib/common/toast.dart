import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// toast
class ToastUtil {
  static const Color _backgroundColor = Color(0x1A000000);
  static const Color _textColor = Color(0xFF666666);

  static void show(
    String msg, {
    toastLength = Toast.LENGTH_SHORT,
    gravity = ToastGravity.BOTTOM,
    fontSize = 13.0,
    Color backgroundColor = Colors.redAccent,
    Color textColor = Colors.white,
  }) {
    /// 开源 Toast
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }
}
