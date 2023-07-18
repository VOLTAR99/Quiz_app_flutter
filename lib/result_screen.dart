import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app2/data/questions.dart';
import 'package:quiz_app2/question Summery/question_summery.dart';
import 'package:quiz_app2/quiz.dart';
import 'package:quiz_app2/question Summery/question_identifier.dart';
import 'package:quiz_app2/question Summery/summary_item.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart});

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummeryData(){
    final List<Map<String, Object>> summery=[];

    for(var i=0; i<chosenAnswers.length;i++){
       summery.add({
         'question_index': i,
         'question':questions[i].Text,
         'correct_answer': questions[i].answers[0],
         'user_answer': chosenAnswers[i]
       },
       );
    }

    return summery;
  }

  @override
  Widget build(BuildContext context){
    final summaryData= getSummeryData();
    final numTotalQuestions= questions.length;
    final numCorrectQuestions=summaryData.where((data) {
      return data['user_answer']==data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,    //is used to consume as much space as needed
        child: Container(
        margin: const EdgeInsets.all(40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
        style: GoogleFonts.lato(
          color: const Color.fromARGB(255, 230, 200, 253),
          fontSize: 25,
        ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        QuestionSummary(summaryData),
        const SizedBox(height: 30,),
        TextButton.icon(
            onPressed: onRestart,
            label:Text('Restart Quiz',
               style: GoogleFonts.mukta(
                 color: Colors.white,
               ),),
        icon: const Icon(Icons.refresh,
        color: Colors.white,),)

      ],
    ),
        ),

    );
  }

}