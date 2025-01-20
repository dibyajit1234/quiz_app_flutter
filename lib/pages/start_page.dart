import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Map<String, dynamic> quizData = {};
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchQuizdata() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final response =
          await http.get(Uri.parse("https://api.jsonserve.com/Uw5CrX"));
      if (response.statusCode == 200) {
        setState(() {
          quizData = json.decode(response.body);
          isLoading = false;
        });
        // ignore: use_build_context_synchronously
        context.goNamed('quiz', extra: quizData);
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load quiz data. Please try again later.';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage =
            'An error occurred. Please check your internet connection and try again.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Quiz",
                    style: TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(5.0, 8.0),
                            blurRadius: 5.0,
                            color: Color.fromARGB(124, 126, 126, 126),
                          ),
                        ]),
                  ),
                  Image(
                    image: AssetImage("assets/image.png"),
                  ),
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      elevation: 10,
                    ),
                    onPressed: fetchQuizdata,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Start Quiz',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
