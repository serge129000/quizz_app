class Quizz {
  String question;
  List<String> suggestions;
  int tRep;
  //
  Quizz(this.question, this.suggestions, this.tRep);
  //
  String reponseQuizz() {
    return suggestions[tRep];
  }
}
