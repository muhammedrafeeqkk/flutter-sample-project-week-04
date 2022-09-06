import 'package:flutter/material.dart';
import 'package:instagram/screens/splash.dart';

// import 'package:instagram/screen1.dart';
const save_key = 'userloggidin';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'instagram',
      theme: ThemeData(primaryColor: Colors.black54),
      home: screensplash(),
    );
  }
}

// class MYAPP extends StatelessWidget {
//   const MYAPP({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

// }
