import 'package:dio_app/helpers/dependency_injection.dart';
import 'package:dio_app/screens/products_screen.dart';
import 'package:flutter/material.dart';

void main() {
  //Iniciar la inyección de dependencias
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ProductsScreen(),
    );
  }
}
