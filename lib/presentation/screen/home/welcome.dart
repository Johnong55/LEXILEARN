import 'package:flutter/material.dart';
import 'package:lexilearn/data/api/Authenticate.dart';
import 'package:lexilearn/presentation/screen/auth/login.dart';
import 'package:lexilearn/presentation/screen/home/Homepage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Định nghĩa trong build, ok với stateless vì chỉ gọi khi bấm nút
    Future<void> checkLoginStatus() async {
      final loggedIn = await isLoggedIn();

      if (loggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  Homepage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "LEXI LEARN",
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Image.asset("assets/welcome2.png"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 30),
                child: Text(
                  "We will help you gain knowledge that will change your life. Participate in challenges and get discounts on training.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Image.asset("assets/welcome.png", fit: BoxFit.contain),
                ),
              ),

              const SizedBox(height: 40),

              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await checkLoginStatus();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 16,
                    ),
                  ),
                  child: const Text(
                    'Start Learning',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
