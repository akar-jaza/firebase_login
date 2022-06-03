// ignore_for_file: control_flow_in_finally

import 'dart:io';

import 'package:flutter/foundation.dart';

double responsivePadding() {
  double padding = 0;
  try {
    if (Platform.isWindows) {
      padding = 25;
    } else if (Platform.isAndroid) {
      padding = 20;
    } else {
      padding = 20;
    }
  } catch (e) {
    if (kIsWeb) {
      padding = 25;
    }
  } finally {
    return padding;
  }
}
