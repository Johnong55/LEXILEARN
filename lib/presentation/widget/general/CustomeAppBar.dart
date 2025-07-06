import 'package:flutter/material.dart';
import 'package:lexilearn/presentation/widget/general/bell.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(190); // Increased height

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration:  BoxDecoration(
        color: Colors.cyanAccent.withOpacity(0.3), // Purple background
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile Picture
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/home/Memoji.png'),

                ),
                // Notification Bell
              BellSwingIcon(),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Hello, Filllo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Winky_Sans',
              ),
            ),
          const SizedBox(height: 5,),
            const Text(
              'What would you like to learn today?',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
