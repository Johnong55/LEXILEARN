import 'package:flutter/material.dart';

Widget buildSocialIcon(String assetPath) {
  return InkWell(
    
    onTap: () {
      // Handle login logic
    },
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Image.asset(
        assetPath,
        width: 24,
        height: 24,
      ),
    ),
  );
}
