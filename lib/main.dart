import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:collegenews/screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    viewDataDirectory(); // Call the function here to print the directory path
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampFeed',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}

Future<void> viewDataDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  print('App directory path: ${directory.path}');
}
