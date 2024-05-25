import 'package:flutter/material.dart';

extension SizedBoxExtension on double {
  SizedBox get h => SizedBox(height: this);
  SizedBox get w => SizedBox(width: this);
}
