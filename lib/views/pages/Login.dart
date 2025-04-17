import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page")),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Flexible(flex: 2, child: Text("Login")),
            Flexible(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(label: Text("Email")),
                controller: _email,
              ),
            ),
            Flexible(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(label: Text("Senha")),
                controller: _senha,
              ),
            ),
            Flexible(
              flex: 2,
              child: ElevatedButton(onPressed: () {}, child: Text("Submit")),
            ),
          ],
        ),
      ),
    );
  }
}
