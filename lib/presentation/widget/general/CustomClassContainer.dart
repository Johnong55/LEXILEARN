import 'package:flutter/material.dart';

class GrammarQuizCard extends StatelessWidget {
  const GrammarQuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F7FB), // light blue background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grammar\nQuiz',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Business English',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Icon(Icons.timer, color: Colors.teal, size: 18),
                    SizedBox(width: 6),
                    Text('2 hours'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Illustration or image
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(
              'assets/home/idea.png', // Replace with your image
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
