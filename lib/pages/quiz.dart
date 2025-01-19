import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/database.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/pages/start_page.dart';

class Quiz extends StatefulWidget {
  final Map<String, dynamic> quizData;
  const Quiz({super.key, required this.quizData});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late int selected;
  late int count;
  late bool correct;
  late int right;
  late int score;
  late Map<String, dynamic> quizData;
  @override
  void initState() {
    super.initState();
    selected = -1;
    count = 0;
    right = -1;
    correct = true;
    score = 0;
    quizData = widget.quizData;
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 4; i++) {
      if (quizData["questions"][count]["options"][i]["is_correct"] == true) {
        right = i;
      }
    }
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Do want to quit the game ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Provider.of<FinalResult>(context)
                                      .removeData();
                                  context.goNamed('home');
                                },
                                child: Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("No"))
                          ],
                        ));
              },
              icon: Icon(Icons.cancel_outlined)),
          title: Center(child: Text("quiz")),
          actions: [
            Icon(Icons.star),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.trolley),
                      SizedBox(
                        child: Text("${count + 1}/10"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                            "Q. ${quizData["questions"][count]["description"]} "),
                      )),
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final item = index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {});
                            selected = item;
                          },
                          child: Card(
                            color: selected == item ? Colors.blue : Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "${index + 1}. ${quizData["questions"][count]["options"][index]["description"]} "),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (selected != -1) {
                            quizData["questions"][count]["options"][selected]
                                        ["is_correct"] ==
                                    correct
                                ? score++
                                : score;
                          }

                          if (count < (quizData["questions"].length - 1)) {
                            Provider.of<FinalResult>(context).addData({
                              'question': quizData["questions"][count]
                                  ["description"],
                              'opt1': quizData["questions"][count]["options"][0]
                                  ["description"],
                              'opt2': quizData["questions"][count]["options"][1]
                                  ["description"],
                              'opt3': quizData["questions"][count]["options"][2]
                                  ["description"],
                              'opt4': quizData["questions"][count]["options"][3]
                                  ["description"],
                              'selected': selected,
                              'correct': right,
                            });
                            setState(() {
                              count++;
                              selected = -1;
                            });
                          } else {
                            count = 0;
                            selected = -1;
                            context.goNamed('score', extra: score);
                          }
                        },
                        child: Text(count < (quizData["questions"].length - 1)
                            ? "Next"
                            : "Submit")),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
