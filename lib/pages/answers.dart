import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/database.dart';

class Answers extends StatelessWidget {
  const Answers({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FinalResult>(context).data;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
          padding: EdgeInsets.all(2),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 255, 252),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Q${index + 1}. ${data[index]["question"]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(data[index]['correct'] == 0 &&
                                        data[index]['selected'] == 0
                                    ? Icons.check
                                    : data[index]['selected'] == 0 &&
                                            data[index]['correct'] != 0
                                        ? Icons.close
                                        : Icons.circle_outlined),
                                Card(
                                  color: data[index]['correct'] == 0
                                      ? Colors.green
                                      : data[index]['selected'] == 0
                                          ? const Color.fromARGB(
                                              255, 248, 70, 16)
                                          : Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("1.${data[index]["opt1"]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(data[index]['correct'] == 1 &&
                                        data[index]['selected'] == 1
                                    ? Icons.check
                                    : data[index]['selected'] == 1 &&
                                            data[index]['correct'] != 1
                                        ? Icons.close
                                        : Icons.circle_outlined),
                                Card(
                                  color: data[index]['correct'] == 1
                                      ? Colors.green
                                      : data[index]['selected'] == 1
                                          ? const Color.fromARGB(
                                              255, 248, 70, 16)
                                          : Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "2.${data[index]["opt2"]}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(data[index]['correct'] == 2 &&
                                        data[index]['selected'] == 2
                                    ? Icons.check
                                    : data[index]['selected'] == 2 &&
                                            data[index]['correct'] != 2
                                        ? Icons.close
                                        : Icons.circle_outlined),
                                Card(
                                  color: data[index]['correct'] == 2
                                      ? Colors.green
                                      : data[index]['selected'] == 2
                                          ? const Color.fromARGB(
                                              255, 248, 70, 16)
                                          : Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("3.${data[index]["opt3"]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(data[index]['correct'] == 3 &&
                                        data[index]['selected'] == 3
                                    ? Icons.check
                                    : data[index]['selected'] == 3 &&
                                            data[index]['correct'] != 3
                                        ? Icons.close
                                        : Icons.circle_outlined),
                                Card(
                                  color: data[index]['correct'] == 3
                                      ? Colors.green
                                      : data[index]['selected'] == 3
                                          ? const Color.fromARGB(
                                              255, 248, 70, 16)
                                          : Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("4.${data[index]["opt4"]}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
