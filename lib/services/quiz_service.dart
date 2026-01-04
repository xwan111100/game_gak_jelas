import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/quiz_question.dart';

class QuizService {
  final _supabase = Supabase.instance.client;

  Future<List<QuizQuestion>> generateQuiz({int questionCount = 5}) async {
    try {
      // Fetch all games from database
      final response = await _supabase
          .from('games')
          .select()
          .limit(20); // Get 20 games to have enough options

      final allGames = List<Map<String, dynamic>>.from(response);

      if (allGames.length < 4) {
        throw Exception('Not enough games in database');
      }

      // Shuffle and pick games for questions
      allGames.shuffle();
      final selectedGames = allGames.take(questionCount).toList();

      // Generate questions
      final questions = selectedGames.map((game) {
        return QuizQuestion.fromGame(game, allGames);
      }).toList();

      return questions;
    } catch (e) {
      throw Exception('Failed to generate quiz: $e');
    }
  }

  Future<void> saveScore({
    required String userId,
    required int score,
    required int totalQuestions,
  }) async {
    try {
      await _supabase.from('quiz_scores').insert({
        'user_id': userId,
        'score': score,
        'total_questions': totalQuestions,
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      // Silent fail for now
    }
  }

  Future<List<Map<String, dynamic>>> getLeaderboard({int limit = 10}) async {
    try {
      final response = await _supabase
          .from('quiz_scores')
          .select('*, users(email)')
          .order('score', ascending: false)
          .limit(limit);

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      return [];
    }
  }
}
