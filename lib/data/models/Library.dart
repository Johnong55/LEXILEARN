import 'package:flutter/material.dart';

class Library {
  final int id;
  final String libraryName;
  final String ownerId;
  final String ownerDisplayName;
  final List<int> vocabularyIds;
  final List<String> vocabularyWords;

  // UI-related fields
  final int completed;
  final int total;
  final Color color;

  Library({
    required this.id,
    required this.libraryName,
    required this.ownerId,
    required this.ownerDisplayName,
    required this.vocabularyIds,
    required this.vocabularyWords,
    this.completed = 0,
    this.total = 0,
    this.color = Colors.grey,
  });

  String get title => libraryName;

  /// 👇 fromJson factory constructor
  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
      id: json['id'],
      libraryName: json['libName'],
      ownerId: json['ownerId'].toString(),
      ownerDisplayName: json['ownerDisplayName'],
      vocabularyIds: List<int>.from(json['vocabularyIds']),
      vocabularyWords: List<String>.from(json['vocabularyWords']),
      completed: 0,
      total: json['vocabularyIds']?.length ?? 0,
      color: Colors.primaries[json['id'] % Colors.primaries.length], // random màu theo id
    );
  }
}
