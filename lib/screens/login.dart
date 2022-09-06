import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:instagram/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenlogin extends StatefulWidget {
  screenlogin({Key? key}) : super(key: key);

  @override
  State<screenlogin> createState() => _screenloginState();
}

class _screenloginState extends State<screenlogin> {
  final _usernamecontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();
  bool _isdatamatched = true;
  final _formkey = GlobalKey<FormState>();

  String password = 'pass';
  String username = 'user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: ListView(
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/instalogo.jpg',
                        height: 200,
                        width: 250,
                      ),
                    ),
                    TextFormField(
                      controller: _usernamecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        hintText: 'username',
                      ),
                      validator: (value) {
                        // if (_isdatamatched) {
                        //   return null;
                        // } else {
                        //   return "username doesn't match";
                        // }
                        if (value == null || value.isEmpty) {
                          return 'value is empty';
                        } else if (value != username) {
                          return "Invalid username";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(

                            // borderSide: BorderSide(width: 100),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: 'password',
                      ),
                      validator: (value) {
                        // if (_isdatamatched) {
                        //   return null;
                        // } else {
                        //   return "username doesn't match";
                        // }
                        if (value == null || value.isEmpty) {
                          return 'value is empty';
                        } else if (value != password) {
                          return "Invalid password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Visibility(
                      visible: _isdatamatched,
                      child: const Text(
                        'forgot your login details?  ',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          checkUser(context);
                        } else {
                          print('data is empty');
                        }
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkUser(BuildContext ctx) async {
    final _username = _usernamecontroller.text;
    final _password = _passwordcontroller.text;
    if (_username == username && password == _password) {
      print('user name and password match');
      final _sharepreference = await SharedPreferences.getInstance();
      _sharepreference.setBool(save_key, true);
      // goto home
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => screenhome()));
    } else {
      print('user name and password does not match');
      // ScaffoldMessenger.of(ctx).showSnackBar(
      //   const SnackBar(
      //     behavior: SnackBarBehavior.floating,
      //     backgroundColor: Colors.red,
      //     margin: EdgeInsets.all(30),
      //     content: Text('username and password does not match'),
      //   ),
      // );
      setState(() {
        _isdatamatched = false;
      });
    }
  }
}
