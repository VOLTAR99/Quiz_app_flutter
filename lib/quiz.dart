import 'package:flutter/material.dart';
import 'package:quiz_app2/data/questions.dart';
import 'package:quiz_app2/result_screen.dart';
import 'package:quiz_app2/start_screen.dart';
import 'package:quiz_app2/question_screen.dart';

class Quiz extends StatefulWidget{
     const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> SelectedAnswers=[];
  var activeScreen='Start-Screen'; //we create the variable in widget type

  //@override

  void setScreen(){
    setState((){
             activeScreen= 'question-screen';  //dynamically changed when the button is pressed
  },);
  }

  void chooseAnswers(String answer){
    SelectedAnswers.add(answer);
    if(SelectedAnswers.length==questions.length){
      setState(() {
        //SelectedAnswers=[];
        activeScreen='Result-Screen';
      });
    }
  }
  void restartQuiz(){
    setState((){
      SelectedAnswers=[];
      activeScreen='question_screen';
  });
}

  @override

  Widget build(context){
    Widget screenWidget=StartScreen(setScreen);   //initially set to start screen

if(activeScreen=='question-screen'){
  screenWidget=Question(
      onSelectAnswer: chooseAnswers);
}

if(activeScreen=='Result-Screen'){
  screenWidget=ResultScreen(
      chosenAnswers:SelectedAnswers,
      onRestart: restartQuiz,
  );
}
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 78, 13, 151),
                    Color.fromARGB(255, 107, 15, 168)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight
              )
           ),
          child: screenWidget,     //we can call th variable activeScreen variable as it is stored as Widget type
        ),
      ),
    );
  }
}