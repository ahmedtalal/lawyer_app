import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app/app.dart';
import 'core/sl.dart';

void main() async {
  await ServicesLocator().init();
  await GetStorage.init();
  runApp(MyApp());
}
