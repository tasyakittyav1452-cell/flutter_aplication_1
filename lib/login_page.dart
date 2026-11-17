import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Login Page")),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
                decoration: InputDecoration(hintText: "input username"),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
                decoration: InputDecoration(hintText: "input password"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),)),
              ElevatedButton(onPressed: () {}, child: Text("Register")),
            ],
          )
        ],
      ),
    );
  }
}
