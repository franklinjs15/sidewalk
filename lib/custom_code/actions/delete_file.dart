// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//This code is used with custom API

import 'dart:io';

Future<bool> deleteFile(String? filePath) async {
  if (filePath != null && filePath.isNotEmpty) {
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
      return true;
    }
  }
  return false;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
