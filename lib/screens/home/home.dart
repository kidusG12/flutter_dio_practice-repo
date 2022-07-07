import 'package:flutter/material.dart';
import 'package:flutter_dio/dio_client/dio_client.dart';
import 'package:flutter_dio/models/user_model.dart';
import 'package:flutter_dio/screens/createUser/createUser.dart';
import 'package:flutter_dio/screens/getUser/getUser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dio package'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(GetUserScreen.routeName),
              child: Text('Get User'),
            ),
            RaisedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(CreateUserScreen.routeName),
              child: Text('CreateUser'),
            ),
          ],
        ),
      ),
    );
  }
}
