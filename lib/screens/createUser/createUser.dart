import 'package:flutter/material.dart';
import 'package:flutter_dio/dio_client/dio_client.dart';
import 'package:flutter_dio/models/userInfo_model.dart';

class CreateUserScreen extends StatefulWidget {
  static const routeName = '/createUserScreen';
  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final DioClient _client = DioClient();
  static final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _job = TextEditingController();
  UserInfo userInfo = UserInfo(name: '', job: '');
  bool _formSubmitted = false;
  bool _hasResponse = false;
  String? _userName;
  String? _userId;
  String? _userJob;
  String? _userCreated;
  String? _userUpdated;


  void _onSubmit() async {
    setState(() {
      _formSubmitted = true;
    });
    if (_formKey.currentState!.validate()) {
      userInfo = UserInfo(name: _name.text, job: _job.text);
      UserInfo? createdUser = await _client.createUser(userInfo: userInfo);
      if (createdUser != null) {
        setState(() {
          _userName = createdUser.name;
          _userId = createdUser.id;
          _userJob = createdUser.job;
          _userCreated = createdUser.createdAt;
          _userUpdated = createdUser.updatedAt;
          _hasResponse = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create user'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                controller: _name,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                controller: _job,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'job',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 50),
              _formSubmitted
                  ? _hasResponse
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('ID: $_userId'),
                              Text('Name: $_userName'),
                              Text('Job: $_userJob'),
                              Text('Created at: $_userCreated'),
                            ],
                          ))
                      : CircularProgressIndicator()
                  : RaisedButton(
                      onPressed: _onSubmit,
                      child: Text('submit'),
                      color: Theme.of(context).primaryColor,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
