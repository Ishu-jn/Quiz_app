import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List questions = [
    {
      "question": "How many colors are there in logo of Google?",
      "optionA": "4",
      "optionB": "3",
      "optionC": "5",
      "optionD": "6",
      "answer": "4",
    },
    {
      "question": "How many legs a cow have?",
      "optionA": "4",
      "optionB": "3",
      "optionC": "5",
      "optionD": "6",
      "answer": "4",
    },
    {
      "question": "How many legs a dog have?",
      "optionA": "4",
      "optionB": "3",
      "optionC": "5",
      "optionD": "6",
      "answer": "4",
    },
    {
      "question": "How many limbs a human have?",
      "optionA": "4",
      "optionB": "3",
      "optionC": "5",
      "optionD": "6",
      "answer": "4",
    },
    {
      "question": "How many colors legs a cat have?",
      "optionA": "4",
      "optionB": "3",
      "optionC": "5",
      "optionD": "6",
      "answer": "4",
    },
  ];

  int rightAnswerCount = 0;
  int wrongAnswerCount = 0;
  int currentIndex = 0;

  validateAnswer(userInput) {
    if (currentIndex < questions.length - 1) if (userInput == questions[currentIndex]["answer"])
      setState(() {
        rightAnswerCount = rightAnswerCount + 1;
        currentIndex += 1;
      });

    if (currentIndex == questions.length - 1) if (userInput == questions[currentIndex]["answer"])
      setState(() {
        rightAnswerCount = rightAnswerCount + 1;
        currentIndex = currentIndex;
      });
    else
      setState(() {
        wrongAnswerCount = wrongAnswerCount + 1;
        currentIndex += 1;
      });
  }

  reset() {
    setState(() {
      int rightAnswerCount = 0;
      int wrongAnswerCount = 0;
      int currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${questions[currentIndex]["question"]}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("${questions[currentIndex]["optionA"]}"),
                    onPressed: () {
                      validateAnswer(questions[currentIndex]["optionA"]);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("${questions[currentIndex]["optionB"]}"),
                    onPressed: () {
                      validateAnswer(questions[currentIndex]["optionB"]);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("${questions[currentIndex]["optionC"]}"),
                    onPressed: () {
                      validateAnswer(questions[currentIndex]["optionC"]);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("${questions[currentIndex]["optionD"]}"),
                    onPressed: () {
                      validateAnswer(questions[currentIndex]["optionD"]);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Right answer: $rightAnswerCount"),
                Text("Wrong answer: $wrongAnswerCount"),
                Text("Total Score: ${rightAnswerCount - wrongAnswerCount}"),
                TextButton(
                  child: Text("Reset"),
                  onPressed: () {
                    reset();
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
      )),
    );
  }
}
