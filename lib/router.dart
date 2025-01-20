import 'package:go_router/go_router.dart';
import 'package:quiz_app/pages/answers.dart';
import 'package:quiz_app/pages/start_page.dart';
import 'package:quiz_app/pages/quiz.dart';
import 'package:quiz_app/pages/result_page.dart';

enum Approuter { home, quiz, result, score }

GoRouter goRouter() {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        name: Approuter.home.name,
        builder: (context, state) => const StartPage(),
      ),
      GoRoute(
        path: '/score',
        name: Approuter.score.name,
        builder: (context, state) {
          final score = state.extra as int;
          return ResultPage(score: score);
        },
      ),
      GoRoute(
        path: '/quiz',
        name: Approuter.quiz.name,
        builder: (context, state) {
          final quizData = state.extra as Map<String, dynamic>;
          return Quiz(quizData: quizData);
        },
      ),
      GoRoute(
        path: '/result',
        name: Approuter.result.name,
        builder: (context, state) {
          return Answers();
        },
      ),
    ],
  );
}
