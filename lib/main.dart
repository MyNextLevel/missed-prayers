import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/core/di/dependency_manager.dart';

void main() async {
  await setUpDependencies();
  runApp(const MyApp());
}
