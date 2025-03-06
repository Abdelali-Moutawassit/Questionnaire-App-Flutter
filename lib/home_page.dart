import 'package:flutter/material.dart';
import 'package:test_app/app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Icon> result = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          children: result,
                        ),
                        SizedBox(height: 5),
                        Image.asset(
                            appBrain.listGroup[appBrain.numeroQuestion].i),
                        SizedBox(height: 25),
                        Text(
                          appBrain.listGroup[appBrain.numeroQuestion].q,
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              setState(() {
                                if (appBrain.checkAnswer(true) == true) {
                                  result.add(Icon(
                                    Icons.thumb_up,
                                    color: Colors.green,
                                  ));
                                } else {
                                  result.add(Icon(
                                    Icons.thumb_down,
                                    color: Colors.red,
                                  ));
                                }
                                if (appBrain.listGroup.length - 1 ==
                                    appBrain.numeroQuestion) {
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title:
                                        "Vous avez repondu a tous les questions",
                                    desc:
                                        "Vous pouvez reprendre le questionnaire",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "ReFaire Le Test",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => {
                                          setState(() {
                                            appBrain.numeroQuestion = 0;
                                          })
                                        },
                                        width: 120,
                                      )
                                    ],
                                  ).show();
                                } else {
                                  appBrain.nextQuestion();
                                }
                              });
                            },
                            child: Text("Vrai"),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              setState(() {
                                if (appBrain.checkAnswer(false) == true) {
                                  result.add(Icon(
                                    Icons.thumb_up,
                                    color: Colors.green,
                                  ));
                                } else {
                                  result.add(Icon(
                                    Icons.thumb_down,
                                    color: Colors.red,
                                  ));
                                }
                                if (appBrain.listGroup.length - 1 ==
                                    appBrain.numeroQuestion) {
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title:
                                        "Vous avez repondu a tous les questions",
                                    desc:
                                        "Vous pouvez reprendre le questionnaire",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "ReFaire Le Test",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => {
                                          setState(() {
                                            appBrain.numeroQuestion = 0;
                                          })
                                        },
                                        width: 120,
                                      )
                                    ],
                                  ).show();
                                } else {
                                  appBrain.nextQuestion();
                                }
                              });
                            },
                            child: Text("Faux"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
