import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ShowToast {
  static dynamic toastShow(
      BuildContext? context, String? msg, Color? _toastColor) {
    showToast(
      msg,
      textStyle: TextStyle(color: _toastColor),
      backgroundColor: Colors.white,
      context: context,
      animation: StyledToastAnimation.fadeScale,
      reverseAnimation: StyledToastAnimation.fadeScale,
      alignment: Alignment.center,
      position: StyledToastPosition.center,
    );
  }
}
