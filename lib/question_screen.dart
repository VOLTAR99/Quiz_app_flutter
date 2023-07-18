import 'package:flutter/material.dart';
import 'package:quiz_app2/answer_button.dart';
import 'package:quiz_app2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget{
  const Question({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<Question> createState(){
    return _Question();
  }
}
class _Question extends State<Question>{

  var currentIndex=0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      //currentQuestion +=n;   //increment by n, and n can be any real number
      currentIndex++; //increment by 1 only.
    });
  }

  @override
  Widget build(context){
    final currentQuestion=questions[currentIndex];
    return  SizedBox(
      width: double.infinity,    //is used to consume as much space as needed
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,                  //consumes the vertical space but from center
          crossAxisAlignment: CrossAxisAlignment.stretch,               //stretch the inner space as wide as possible
          children: [
            Text(currentQuestion.Text,
              style:
              GoogleFonts.abrilFatface(      //used third party "google fonts" to customized the font style
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswer().map((answer){
            return AnswerButton(
                answerText: answer,
                onTap:(){
                  answerQuestion(answer);
                });   //it mention answer buttons
            })
            // AnswerButton(
            //     answerText: currentQuestion.answers[0],
            //     onTap: (){}
            // ),
            // AnswerButton(
            //     answerText: currentQuestion.answers[1],
            //     onTap: (){}
            // ),
            // AnswerButton(
            //     answerText: currentQuestion.answers[2],
            //     onTap: (){}
            // ),
            // AnswerButton(
            //     answerText: currentQuestion.answers[3],
            //     onTap: (){}
            // ),

          ],
        ),
      ),
    );
  }
}