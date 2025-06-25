import 'dart:ffi';

import 'package:lexilearn/data/models/vocabulary.dart';

class Library {
    Long id;
    String  libraryName;
    String ownerId;
     String ownerDisplayName;
    List<Long> vocabularyIds;
    List<String> vocabularyWords;
    Library({required this.id,required this.libraryName,required this.ownerDisplayName,required this.ownerId,required this.vocabularyIds,required this.vocabularyWords}); 
   
}