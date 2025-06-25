import 'dart:ffi';

class Question {
  Long id ;
  String content;
  Long questionID;  
  String vocabularyWord;
  Question({required this.content, required this.id,required this.questionID,required  this.vocabularyWord});
}
