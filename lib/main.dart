import 'package:flutter/material.dart';
import 'package:quizzer3/quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz firstexam = Quiz(); // this is an object that contains the list of question which is a private class which in turn contains another class of type question

void main() {
  runApp(const Quizzer());
}

class Quizzer extends StatelessWidget {
  const Quizzer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Quizpage()
            )
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {

  List<Icon> scoreKeeper = [// this is a list of icons to show a visuals of right and wrong answers.
  ];

  void checkanswer(bool answerpicked){ // this function checks if the answer picked by the user is correct.
    bool correctanswer = firstexam.getQuestionanswer();
    if (scoreKeeper.length == firstexam.examquestionslength()){
      return;
    }
    else if (correctanswer == answerpicked){
      scoreKeeper.add(
          const Icon(Icons.check,
              color: Colors.green));
    }
    else {
      scoreKeeper.add(
          const Icon(Icons.close,
              color: Colors.red));
    }
    setState(() {
      firstexam.nextquestion();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(firstexam.getQuestiontext(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    height: 1.6,
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)
            ),
          ),
        ),
        TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(25))),
            onPressed: () {
              //firstexam.examquestions[questioncount].questionanswer = true;// this shows that with just this line of code, all answers in our quiz can be set to true which ruins the whole code and to fix it we have to make our quiz private.
              checkanswer(true);
            },
            child: const Text('True',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)
            )
        ),
        const SizedBox(height: 10),
        TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(25))),
            onPressed: () {
              //firstexam.examquestions[questioncount].questionanswer = true;// this shows that with just this line of code, all answers in our quiz can be set to true which ruins the whole code and to fix it we have to make our quiz private.
              checkanswer(false);
            },
            child: const Text('False',
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)
            )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
              children: scoreKeeper
          ),
        ),
        //TODO: Add a row here as your score keeper.
        TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20))),
            onPressed: (){
              setState(() {
                if(scoreKeeper.isNotEmpty){
                  Alert(context: context, title: "RESET", desc: "Have a second go at it.",).show();
                  firstexam.lastquestion();
                  scoreKeeper.clear();
                }
              });
            }, child: const Text('Reset',
            style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.w500,
                color: Colors.black)
        )
        ),
      ],
    );
  }
}
