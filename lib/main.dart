import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_ui_200lab/src/app.dart';
import 'package:travel_ui_200lab/src/helpers/local_storage_helper.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStoragehelper.initLocalStorageHelper();
  runApp(const MyApp());
}
