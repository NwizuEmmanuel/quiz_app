class QuizQuestion{
  final String text;
  final List<String> options;

  const QuizQuestion(this.text, this.options);

  List<String> getShuffledOptions(){
    final shuffledOptions = List.of(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }
}