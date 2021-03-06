import 'dart:io';
import 'package:bytebankapp/database/app_database.dart';
import 'package:bytebankapp/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const BytebankApp());
  findAll().then((contacts) => debugPrint(contacts.toString()));
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green[900],
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Colors.blueAccent[700]),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary,
            )),
        home: const Dashboard());
  }
}
