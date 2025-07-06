// custom_bottom_nav.dart
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // ✅ Add this line

        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.black, // <- changed this
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey.shade300,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: "Flashcards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Rewards",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.tune), label: "Settings"),
        ],
      ),
    );
  }
}
