class QuizQuestion {
  final String gameId;
  final String correctAnswer;
  final List<String> options;
  final String hint;
  final String genre;
  final String releaseYear;

  QuizQuestion({
    required this.gameId,
    required this.correctAnswer,
    required this.options,
    required this.hint,
    required this.genre,
    required this.releaseYear,
  });

  factory QuizQuestion.fromGame(Map<String, dynamic> correctGame, List<Map<String, dynamic>> allGames) {
    // Get correct answer
    final correctAnswer = correctGame['title'] as String;
    
    // Get 3 random wrong answers
    final wrongGames = allGames
        .where((g) => g['id'] != correctGame['id'])
        .toList()
      ..shuffle();
    
    final wrongAnswers = wrongGames
        .take(3)
        .map((g) => g['title'] as String)
        .toList();
    
    // Combine and shuffle options
    final options = [correctAnswer, ...wrongAnswers]..shuffle();
    
    return QuizQuestion(
      gameId: correctGame['id'],
      correctAnswer: correctAnswer,
      options: options,
      hint: correctGame['description'] ?? 'A popular game',
      genre: correctGame['genre'] ?? 'Unknown',
      releaseYear: correctGame['release_date']?.substring(0, 4) ?? 'Unknown',
    );
  }
}