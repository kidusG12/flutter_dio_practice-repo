import 'package:flutter/material.dart';

import '../../dio_client/dio_client.dart';
import '../../models/user_model.dart';

class GetUserScreen extends StatefulWidget {
  static const routeName = '/getUserScreen';
  const GetUserScreen({Key? key}) : super(key: key);

  @override
  _GetUserScreenState createState() => _GetUserScreenState();
}

class _GetUserScreenState extends State<GetUserScreen> {
  final DioClient _client = DioClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User info')),
      body: Center(
        child: FutureBuilder<User?>(
          future: _client.getUser(id: '2'),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              User? userInfo = snapshot.data;
              if (userInfo != null) {
                Data userData = userInfo.data;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(userData.avatar),
                    SizedBox(height: 8.0),
                    Text(
                      '${userInfo.data.firstName} ${userInfo.data.lastName}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      userData.email,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
