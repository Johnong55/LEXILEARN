import 'package:flutter/material.dart';
import 'package:lexilearn/data/api/Authenticate.dart';
import 'package:lexilearn/presentation/screen/home/welcome.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(onPressed: () async{ 
          await logout();
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  WelcomePage()),
        );
        }, child: Icon(Icons.logout)),
      ),
    );
  }
}