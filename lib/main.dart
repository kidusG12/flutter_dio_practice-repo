import 'package:flutter/material.dart';
import 'package:flutter_dio/screens/createUser/createUser.dart';
import 'package:flutter_dio/screens/getUser/getUser.dart';
import 'package:flutter_dio/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        GetUserScreen.routeName: (ctx) => GetUserScreen(),
        CreateUserScreen.routeName: (ctx) => CreateUserScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      },
    );
  }
}
