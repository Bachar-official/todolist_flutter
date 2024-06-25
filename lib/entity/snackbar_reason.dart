import 'package:flutter/material.dart';

enum SnackbarReason {
  success, warning, error;

  Color getSnackbarColor() {
    switch (this) {
      case SnackbarReason.success: return Colors.green;
      case SnackbarReason.warning: return Colors.yellowAccent;
      case SnackbarReason.error: default: return Colors.red;      
    }
  }  
}