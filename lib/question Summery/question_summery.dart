import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app2/question%20Summery/summary_item.dart';

class QuestionSummary  extends StatelessWidget{
  const QuestionSummary(this.summaryData,{super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
                  (data) {
           return SummaryItem(data);
                    // Row(
          //   children: [
          //      Text((
          //          (data['question_index'] as int) + 1).toString(),
          //
          //      ),
          //
          //   Expanded(                                      //allows its child to take remaining spaces so no pixel would break
          //     child: Column(
          //       children: [
          //       Text(data['question'] as String,
          //         style: GoogleFonts.merriweather(
          //             color: Colors.amberAccent,
          //             fontSize: 16
          //         ),),
          //       const SizedBox(height: 5,),
          //       Text(data['user_answer'] as String,
          //           ),
          //       Text(data['correct_answer'] as String,
          //           ),
          //     ],),
          //   ),
          // ],
          // );
                    },
          ).toList(),
        ),
      ),
    );
  }
}