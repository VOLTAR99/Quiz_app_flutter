
class QuizQuestions{
  const QuizQuestions(this.Text,this.answers);

  final String Text;
  final List<String> answers;

  List<String> getShuffledAnswer(){     //created a new func to store the copy of original answers
    final ShuffledList=List.of(answers);   //.of() will copy answers from "answers" list and stored it in new shuffled list.
    ShuffledList.shuffle();      //shuffle the answers in the variable named shuffledList.
    return ShuffledList;         //returning the shuffled list
  }                             //using this method the original format of answer will not get shuffled
                       //instead the new coped list will get shuffled so that we can insure that the 1st  option is always the correct option in our original answers
}