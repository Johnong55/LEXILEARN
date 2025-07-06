import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:lexilearn/data/models/Library.dart';

class LibraryNotifier extends StateNotifier<List<Library>> {
  LibraryNotifier()
    : super([
        Library(
          id: 1,
          libraryName: "German Language",
          ownerId: "user_001",
          ownerDisplayName: "Alice",
          vocabularyIds: [101, 102, 103],
          vocabularyWords: ["Hallo", "Tschüss", "Danke"],
          completed: 15,
          total: 20,
          color: Colors.cyanAccent,
        ),
        Library(
          id: 2,
          libraryName: "Spanish Language",
          ownerId: "user_002",
          ownerDisplayName: "Bob",
          vocabularyIds: [201, 202, 203],
          vocabularyWords: ["Hola", "Adiós", "Gracias"],
          completed: 10,
          total: 30,
          color: Colors.blueAccent,
        ),
        Library(
          id: 3,
          libraryName: "French Language",
          ownerId: "user_003",
          ownerDisplayName: "Charlie",
          vocabularyIds: [301, 302, 303],
          vocabularyWords: ["Bonjour", "Merci", "Au revoir"],
          completed: 5,
          total: 25,
          color: Colors.deepPurpleAccent,
        ),
      ]);

  void addLibrary([Library? library]) {
    library ??= Library(
      id: 4,
      libraryName: "New Library",
      ownerId: "user_xxx",
      ownerDisplayName: "Someone",
      vocabularyIds: [],
      vocabularyWords: [],
      completed: 0,
      total: 0,
      color: Colors.grey,
    );
    state = [...state, library];
  }

  void removeLibrary(String title) {
    state = state.where((lib) => lib.title != title).toList();
  }

  void updateLibrary(String title, Library newLib) {
    state = [
      for (final lib in state)
        if (lib.title == title) newLib else lib,
    ];
  }
}

final libraryProvider = StateNotifierProvider<LibraryNotifier, List<Library>>(
  (ref) => LibraryNotifier(),
);
