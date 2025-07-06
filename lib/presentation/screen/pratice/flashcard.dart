import 'package:flutter/material.dart';
import 'package:lexilearn/presentation/widget/flashcard/CustomeFlashCard.dart';
import 'package:lexilearn/presentation/widget/flashcard/flashcard_control.dart';
import 'dart:math' as math;

class Flashcard {
  final String question;
  final String answer;

  Flashcard({required this.question, required this.answer});
}

class FlashcardHome extends StatefulWidget {
  @override
  _FlashcardHomeState createState() => _FlashcardHomeState();
}

class _FlashcardHomeState extends State<FlashcardHome> with TickerProviderStateMixin {
  late AnimationController _flipController;
  late AnimationController _slideController;
  late AnimationController _scaleController;

  late Animation<double> _flipAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final List<Flashcard> flashcards = [
    Flashcard(
      question: 'What is Flutter?',
      answer: 'Flutter is Google\'s UI toolkit for building natively compiled applications.',
    ),
    Flashcard(
      question: 'What is a Widget in Flutter?',
      answer: 'A Widget describes part of a UI. Everything in Flutter is a widget.',
    ),
    Flashcard(
      question: 'Stateless vs Stateful Widget?',
      answer: 'StatelessWidget is immutable. StatefulWidget changes over time.',
    ),
    Flashcard(
      question: 'What is Hot Reload?',
      answer: 'Hot Reload injects updated source code files into the running Dart VM.',
    ),
    Flashcard(
      question: 'What is Dart?',
      answer: 'Dart is a client-optimized language by Google, used with Flutter.',
    ),
  ];

  int currentIndex = 0;
  bool isFlipped = false;

  @override
  void initState() {
    super.initState();

    _flipController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _slideController.forward();
  }

  @override
  void dispose() {
    _flipController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (!isFlipped) {
      _flipController.forward();
    } else {
      _flipController.reverse();
    }
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  void _nextCard() {
    if (currentIndex < flashcards.length - 1) {
      _slideController.reset();
      _flipController.reset();
      setState(() {
        currentIndex++;
        isFlipped = false;
      });
      _slideController.forward();
    }
  }

  void _previousCard() {
    if (currentIndex > 0) {
      _slideController.reset();
      _flipController.reset();
      setState(() {
        currentIndex--;
        isFlipped = false;
      });
      _slideController.forward();
    }
  }

  void _resetCards() {
    _slideController.reset();
    _flipController.reset();
    setState(() {
      currentIndex = 0;
      isFlipped = false;
    });
    _slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final flashcard = flashcards[currentIndex];
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black,Colors.grey.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Flashcard Learning',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${currentIndex + 1}/${flashcards.length}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              // Progress bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LinearProgressIndicator(
                  value: (currentIndex + 1) / flashcards.length,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),

              // Flashcard
              Expanded(
                child: Center(
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: FlashcardCard(
                        onFlip: _flipCard,
                        flipAnimation: _flipAnimation,
                        flashcard: flashcard,
                      ),
                    ),
                  ),
                ),
              ),

              // Controls
              FlashcardControls(
                isFlipped: isFlipped,
                onFlip: _flipCard,
                onNext: _nextCard,
                onPrevious: _previousCard,
                onReset: _resetCards,
                onSave: () => {},
                hasPrevious: currentIndex > 0,
                hasNext: currentIndex < flashcards.length - 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
