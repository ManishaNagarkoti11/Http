import 'package:flutter/material.dart';
//import 'package:fhttp/widgets/user_card.dart';
import 'package:http/http.dart';
//import 'package:fhttp/widgets/post_card.dart';
//import 'package:fhttp/screen/postscreen.dart';
import 'package:fhttp/screen/user_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home:PostScreen(),
      home: UserScreen(),
    );
  }
}
