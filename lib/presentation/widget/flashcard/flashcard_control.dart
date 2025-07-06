import 'package:flutter/material.dart';

class FlashcardControls extends StatelessWidget {
  final bool isFlipped;
  final VoidCallback onFlip;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onReset;
  final VoidCallback onSave;
  final bool hasPrevious;
  final bool hasNext;


  const FlashcardControls({
    super.key,
    required this.onSave,
    required this.isFlipped,
    required this.onFlip,
    required this.onNext,
    required this.onPrevious,
    required this.onReset,
    required this.hasPrevious,
    required this.hasNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onSave ,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue.shade700,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              elevation: 5,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(isFlipped ? Icons.done_rounded: Icons.save),
                SizedBox(width: 8),
                Text(isFlipped ? 'Save' : 'DONE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: hasPrevious ? onPrevious : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  foregroundColor: Colors.blue.shade700,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                ),
                child: Icon(Icons.arrow_back, size: 24),
              ),
              ElevatedButton(
                onPressed: onReset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                ),
                child: Icon(Icons.refresh, size: 24),
              ),
              ElevatedButton(
                onPressed: hasNext ? onNext : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  foregroundColor: Colors.blue.shade700,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15),
                ),
                child: Icon(Icons.arrow_forward, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
