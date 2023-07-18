import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.screenChanger,{super.key});

  final void Function() screenChanger;       //using this method of calling we created a pointer variable which is final
                                             //using this pointer variable we can use it in our button
  @override
  Widget build(context){
     return Center(

       child:Column(
         mainAxisSize: MainAxisSize.min,
         children:[
          Opacity(
            opacity: 0.7,
             child: Image.asset('assets/logos/5ede4a3fb760540004f2c5e9.png',
             width: 500,
             ),
           ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset('assets/logos/quiz-logo.png',
          //       width: 300),
          // ),
           const SizedBox(height: 80),
           Text('Let see how much you know about Demon Slayer!',
           style: GoogleFonts.satisfy(
             color: const Color.fromARGB(255, 201, 153, 251),
             fontSize: 28,
             fontWeight: FontWeight.bold,
           ),
             textAlign: TextAlign.center,
           ),
           const SizedBox(height: 30),
           OutlinedButton.icon(
             onPressed: screenChanger,    //we can directly use it as a pointer variable, as a function is not required
             style: OutlinedButton.styleFrom(
               foregroundColor: const Color.fromARGB(255, 237, 223, 252)
             ),
             label:const Text('Start Quiz'),
             icon: const Icon(Icons.arrow_right),
           ),
         ],
       ),
     );
  }
}