/*
1. Expanded Widget
  Aufgabe:
  Erstelle eine Benutzeroberfläche, die eine Row enthält, in der zwei Container mit fester Breite und ein Container
  mit dynamischer Breite (mittels Expanded) enthalten sind.

  Anforderungen:
	•	Der erste Container soll eine feste Breite von 100 Pixeln haben und rot sein.
	•	Der zweite Container soll den verbleibenden Platz in der Row einnehmen und grün sein.
	•	Der dritte Container soll eine feste Breite von 100 Pixeln haben und blau sein.

2. Dialog (AlertDialog)
  Aufgabe:
  Erstelle einen Button, der einen AlertDialog anzeigt, wenn er gedrückt wird.
  Der Dialog soll einen Titel, eine Nachricht und zwei Buttons (“Abbrechen” und “OK”) enthalten.
  
  Anforderungen:
	•	Der Button soll einen AlertDialog anzeigen.
	•	Der AlertDialog soll einen Titel und eine Nachricht haben.
	•	Der Dialog soll zwei Buttons enthalten: “Abbrechen” und “OK”

3. Expanded und Card
  Aufgabe:
  Erstelle eine Benutzeroberfläche, die eine Row enthält, in der zwei Card-Widgets und ein Expanded-Widget enthalten sind.
  
  Anforderungen:
	•	Das erste Card-Widget soll eine feste Breite von 100 Pixeln haben und Text anzeigen.
	•	Das zweite Card-Widget soll eine feste Breite von 100 Pixeln haben und Text anzeigen.
	•	Das Expanded-Widget in der Mitte soll den verbleibenden Platz einnehmen und Text anzeigen.

4. Snackbar und Dialog
  Aufgabe:
  Erstelle eine Benutzeroberfläche, die einen Button enthält. Wenn dieser Button gedrückt wird, soll zuerst ein 
  AlertDialog angezeigt werden. Wenn der Benutzer auf “OK” klickt, soll eine Snackbar angezeigt werden.

  Anforderungen:
	•	Der Button soll einen AlertDialog anzeigen.
	•	Der AlertDialog soll eine “OK”-Schaltfläche haben.
	•	Wenn auf “OK” geklickt wird, soll eine Snackbar mit einer Nachricht angezeigt werden.

*/

import 'package:flutter/material.dart';

class Task453WichtigeWidgets4 extends StatelessWidget {
  const Task453WichtigeWidgets4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("4.5.3 Wichtige Widgets IV"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 600,
          color: Colors.grey,
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      height: 100,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  )
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Tuched"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"))
                        ],
                      );
                    },
                  );
                },
                child: const Text("Touch Me!"),
              ),
              const Spacer(),
              const Row(
                children: [
                  Card(
                    elevation: 3,
                    color: Colors.red,
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text(
                            "Card",
                          ),
                        )),
                  ),
                  Expanded(
                    child: Text(
                      "Expanded",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Card(
                    elevation: 3,
                    color: Colors.blue,
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text(
                            "Card",
                          ),
                        )),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Alert Dialog"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _showMySnackbar(context, "Snackbar");
                              },
                              child: const Text("OK"))
                        ],
                      );
                    },
                  );
                },
                child: const Text("Show Dialog"),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

void _showMySnackbar(BuildContext contextt, String message) {
  ScaffoldMessenger.of(contextt).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
