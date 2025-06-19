import 'package:flutter/material.dart';
import 'package:lexilearn/data/api/Authenticate.dart';
import 'package:lexilearn/presentation/screen/home/welcome.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(child:  Text("LOGOUT"), onPressed: () async {
                await logout();
                Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const WelcomePage()),
        );
          },)
        ),
    );
  }
}