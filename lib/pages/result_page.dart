import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/database.dart';

class ResultPage extends StatelessWidget {
  final int? score;
  const ResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 404,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    height: 150,
                    image:
                        AssetImage("assets/ryan-yao-hhBvtVxDV_I-unsplash.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          score! >= 30 ? Icons.star : Icons.star_border,
                          size: 70,
                        ),
                        Icon(
                          score! >= 50 ? Icons.star : Icons.star_border,
                          size: 70,
                        ),
                        Icon(
                          score == 100 ? Icons.star : Icons.star_border,
                          size: 70,
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "${score! * 100 / 10} %",
                        style: TextStyle(fontSize: 30),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            context.pushNamed('result');
                          },
                          child: Text("See answers")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            Provider.of<FinalResult>(context, listen: false)
                                .removeData();
                            context.goNamed('home');
                          },
                          child: Text("Try again")),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
