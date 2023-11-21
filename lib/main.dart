import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/create.dart';
import './screens/details.dart';
import './screens/edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Flutter + PHP CRUD',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/create': (context) => const Create(),
        '/details': (context) => const Details(),
        '/edit': (context) => const Edit(),
      },
    );
  }
}
