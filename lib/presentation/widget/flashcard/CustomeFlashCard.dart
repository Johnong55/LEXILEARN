import 'package:flutter/material.dart';
import 'package:lexilearn/presentation/screen/pratice/flashcard.dart';
import 'dart:math' as math;

class FlashcardCard extends StatelessWidget {
  final Animation<double> flipAnimation;
  final Flashcard flashcard;
   final VoidCallback onFlip;
  const FlashcardCard({
    super.key,
    required this.onFlip,
    required this.flipAnimation,
    required this.flashcard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFlip,
      child: AnimatedBuilder(
        animation: flipAnimation,
        builder: (context, child) {
          final isFront = flipAnimation.value < 0.5;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(flipAnimation.value * math.pi),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.5,
              child: isFront ? _buildFrontCard(context) : _buildBackCard(context),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFrontCard(BuildContext context) {
    return _baseCard(
      color: Colors.white,
      icon: Icons.quiz,
      title: 'Question',
      text: flashcard.question,
      textColor: Colors.blue.shade700,
    );
  }

  Widget _buildBackCard(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(math.pi),
      child: _baseCard(
        color: Colors.green.shade50,
        icon: Icons.lightbulb,
        title: 'Answer',
        text: flashcard.answer,
        textColor: Colors.green.shade700,
      ),
    );
  }

  Widget _baseCard({
    required Color color,
    required IconData icon,
    required String title,
    required String text,
    required Color textColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: textColor.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: textColor),
          SizedBox(height: 20),
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
          SizedBox(height: 20),
          Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey.shade800)),
        ],
      ),
    );
  }
}
