Quiz App
A simple quiz application built with Flutter. This app allows users to take a quiz, view their results, and see the correct answers.

Features:-

1. Fetch quiz data from an API
2. Display quiz questions and options
3. Track and display the user's score
4. Show correct and incorrect answers
5. Navigate between different screens using go_router
6. Manage state using provider

Getting Started:-

1. Prerequisites
2. Flutter SDK: Install Flutter
3. Dart SDK: Included with Flutter

Installation:-

1. Clone the repository: git clone https://github.com/dibyajit1234/quiz_app_flutter.git

    cd quiz_app

2. Install dependencies: flutter pub get
3. Run the app : flutter run

Project Structure:-

lib/

├── main.dart

├── database.dart

├── router.dart

├── pages/

│   ├── start_page.dart

│   ├── quiz.dart

│   ├── result_page.dart

│   └── answers.dart

Main Files:-

1. main.dart: Entry point of the application. Initializes the provider and sets up the go_router.
2. database.dart: Contains the FinalResult class for managing quiz results.
3. router.dart: Defines the routes for the application using go_router.
4. pages/start_page.dart: The start page where users can begin the quiz.
5. pages/quiz.dart: The quiz page where users answer questions.
6. pages/result_page.dart: The result page that displays the user's score.
7. pages/answers.dart: The answers page that shows the correct and incorrect answers.


