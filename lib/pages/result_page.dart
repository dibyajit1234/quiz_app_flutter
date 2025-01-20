import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/database.dart';

class ResultPage extends StatelessWidget {
  final int score;
  const ResultPage({super.key, required this.score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Result",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 130, 13),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(score * 10 >= 30 ? "You Won" : "Try Again",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 130, 13),
                          fontWeight: FontWeight.bold,
                          fontSize: 35)),
                ),
              ],
            ),
          ),
          Image(
              image: AssetImage(
                  score * 10 >= 30 ? "assets/win.webp" : "assets/loose.webp")),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          score * 10 >= 30 ? Icons.star : Icons.star_border,
                          size: 75,
                        ),
                        Icon(
                          score * 10 >= 50 ? Icons.star : Icons.star_border,
                          size: 75,
                        ),
                        Icon(
                          score * 10 == 100 ? Icons.star : Icons.star_border,
                          size: 75,
                        )
                      ],
                    ),
                  ),
                  Text(
                    "${score * 10} %",
                    style: TextStyle(fontSize: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            elevation: 10,
                          ),
                          onPressed: () {
                            context.pushNamed('result');
                          },
                          child: Text(
                            "See answers",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            elevation: 10,
                          ),
                          onPressed: () {
                            Provider.of<FinalResult>(context, listen: false)
                                .removeData();
                            context.goNamed('home');
                          },
                          child: Text(
                            "Try again",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
