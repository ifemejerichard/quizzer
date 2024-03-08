import 'package:quizzer3/question.dart';

class Quiz {

  int _questioncount = 0;// this variable helps keep track of where we are in out QUESTION list and it is also private so it can only be accessed by Quiz object.

  final List<Question> _examquestions = [ // this is a list of type QUESTION which is a class.
    //the underscore before the list name makes it private meaning only method inside of the class can access it.
    Question('Does 12 inches equal 1 feet.', true),
    Question('Is the Burj Khalifa the tallest\'s building on earth.', true),
    Question('Nigeria is the most populous white nation', false),
    Question('Ronaldo is the best player in the world', true),
    Question('Tinubu is Nigeria\'s best president', false),
    Question('France was a finalist in the just concluded world cup', true),
    Question('Messi is currently playing in South America', false),
    Question('You have reached the end, hope you did good.', false),
  ];

  void nextquestion (){
    if (_questioncount < _examquestions.length - 1){
      _questioncount++;
    }
  }

  String getQuestiontext (){
    return _examquestions[_questioncount].questiontext;
    //with this method(a function inside a class) we are now able to pull the questiontext from out private class list.
  }

  bool getQuestionanswer (){
    return _examquestions[_questioncount].questionanswer;
    //with this method(a function inside a class) we are now able to pull the questionanswer from out private class list.
  }

  int examquestionslength(){
    return _examquestions.length;
  }

  void lastquestion(){
      _questioncount = 0;
  }
}