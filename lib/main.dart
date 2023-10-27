import 'package:flutter/material.dart';
import 'package:workapp/helpers/dio.dart';
import 'package:workapp/helpers/shared.dart';
import 'package:workapp/screens/material/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashedHelper.init();
  DioHelper.init();
  runApp(const WorkApp());
}
